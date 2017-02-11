% time_paths: simulates the trajectories for a model

% Define user as 'ivan' or 'derek'
user = 'ivan';
run user_switch
topdir = [dir_root '\results'];

% Test accuracy against Nordhaus paths (begin in 2015)
LogicalOpts.test_nordhaus = 1;

% Calculate SCC
LogicalOpts.scc_switch = 0;

% Number of runs
num_runs = 1;

% Terminal simulation period
T = 200;

% Initialize vectors, etc
run initialize_simulation
Params.final_year = T;

% Pre-allocate exogenous variable trajectories
[VarsExog] = ...
    transitions_exogenous(Params,LogicalOpts);

% Parallel simulation of the trajectories
for runcount = 1:num_runs
    
    % Simulate trajectories
    [s_out, q_out, v_out, mus_out, scc_out, ...
        foc_error_out, mean_belief_out, var_belief_out, channels_out, fb_out]...
        = simulate_paths(Params,VarsExog,LogicalOpts,...
        space,space_terminal);

    k_store(:,runcount) = s_out(:,1);
    mlo_store(:,runcount) = s_out(:,2);
    mup_store(:,runcount) = s_out(:,3);
    matm_store(:,runcount) = s_out(:,4);
    ts_store(:,runcount) = s_out(:,5);
    to_store(:,runcount) = s_out(:,6);
    mean_store(:,runcount) = s_out(:,7);
    var_store(:,runcount) = s_out(:,8);
    q_store(:,:,runcount) = q_out;
    v_store(:,runcount) = v_out;
    mus_store(:,runcount) = mus_out;
    scc_store(:,runcount) = scc_out;
    foc_store(:,:,runcount) = foc_error_out;
    mean_belief_store(:,runcount) = mean_belief_out;
    var_belief_store(:,runcount) = var_belief_out;
    fb_store(1,runcount) = fb_out;

end


save_string = ['num_runs_' num2str(num_runs) '_nord_' num2str(LogicalOpts.test_nordhaus) '.mat'];
cd([topdir '\' dirname '\time_paths']);

clear logical_*
save(save_string);

clear options x1 qstart value_handle temp_adder

% change abatement to percentage

time_timepath = toc(time_path_count);
time_timepath = time_timepath/60;
disp(['Time to complete plotting time paths: ',num2str(time_timepath),' minutes'])
