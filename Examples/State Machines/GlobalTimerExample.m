% Example state matrix: A global timer ends an infinite loop

sma = NewStateMachine();
sma = SetGlobalTimer(sma, 1, 3); %This legacy syntax is supported. Arguments: (sma, GlobalTimerNumber, Duration(s))
sma = AddState(sma, 'Name', 'TimerTrig', ...
    'Timer', 0,...
    'StateChangeConditions', {'Tup', 'Port1Lit'},...
    'OutputActions', {'GlobalTimerTrig', 1});
sma = AddState(sma, 'Name', 'Port1Lit', ...
    'Timer', .25,...
    'StateChangeConditions', {'Tup', 'Port3Lit', 'GlobalTimer1_End', 'exit'},...
    'OutputActions', {'PWM1', 255});
sma = AddState(sma, 'Name', 'Port3Lit', ...
    'Timer', .25,...
    'StateChangeConditions', {'Tup', 'Port1Lit', 'GlobalTimer1_End', 'exit'},...
    'OutputActions', {'PWM3', 255});

