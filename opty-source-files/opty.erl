-module(opty).
-export([start/6, stop/2, startRemote/6]).

%% Clients: Number of concurrent clients in the system
%% Entries: Number of entries in the store
%% Reads: Number of read operations per transaction
%% Writes: Number of write operations per transaction
%% Time: Duration of the experiment (in secs)

start(Clients, Entries, Reads, Writes, Time, RemoteIns) ->
    register(s, server:start(Entries)),
    L = startClients(Clients, [], Entries, Reads, Writes, s),
    io:format("Starting: ~w CLIENTS, ~w ENTRIES, ~w RDxTR, ~w WRxTR, DURATION ~w s~n",
         [Clients, Entries, Reads, Writes, Time]),
    timer:sleep(Time*1000),
    stop(L, RemoteIns).

stop(L, RemoteIns) ->
    io:format("Stopping...~n"),
    stopClients(L),
    s ! RemoteIns,
    io:format("Stopped~n").

startRemote(Clients, Entries, Reads, Writes, Time, RemoteIns) ->
  L = startClients(Clients, [], Entries, Reads, Writes, RemoteIns),
  io:format("Starting: ~w CLIENTS, ~w ENTRIES, ~w RDxTR, ~w WRxTR, DURATION ~w s~n",
       [Clients, Entries, Reads, Writes, Time]),
  timer:sleep(Time*1000),
  stopClients(L).

startClients(0, L, _, _, _, _) -> L;
startClients(Clients, L, Entries, Reads, Writes, RemoteIns) ->
    Pid = client:start(Clients, Entries, Reads, Writes, RemoteIns),
    startClients(Clients-1, [Pid|L], Entries, Reads, Writes, RemoteIns).

stopClients([]) ->
    ok;
stopClients([Pid|L]) ->
    Pid ! {stop, self()},
    receive
        {done, Pid} -> ok
    end,
    stopClients(L).

