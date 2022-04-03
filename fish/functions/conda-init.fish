function conda-init --argument-names env --description \
'Initialize conda'

    set -gx CONDA_LEFT_PROMPT 1
    # It is better not to put this in config.fish since this is slow
    eval $CONDADIR/bin/conda "shell.fish" "hook" | source
    conda activate shell

    function __conda_add_prompt
        # Do nothing, the prompt is added in fish_prompt
    end
end
