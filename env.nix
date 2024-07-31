{ ... }: {
	environment.sessionVariables = rec {
		HOME="/users/$USER/Local";

		XDG_BIN_HOME="\${HOME}/bin";
		XDG_CONFIG_HOME="\${HOME}/etc";
		XDG_CACHE_HOME="\${HOME}/cache";
		XDG_DATA_HOME="\${HOME}/share";
		XDG_STATE_HOME="\${HOME}/state";

		XDG_DESKTOP_DIR="/users/$USER/Desktop";
		XDG_DOCUMENTS_DIR="/users/$USER/Documents";
		XDG_DOWNLOAD_DIR="/users/$USER/Downloads";
		XDG_MUSIC_DIR="/users/$USER/Music";
		XDG_PICTURES_DIR="/users/$USER/Images";
		XDG_PUBLICSHARE_DIR="/users/$USER/Shared";
		XDG_TEMPLATES_DIR="/users/$USER/Templates";
		XDG_VIDEOS_DIR="/users/$USER/Videos";

		# Enforce XDG Base Directories where possible with env variables
		# Mostly based on information from https://wiki.archlinux.org/title/XDG_Base_Directory

		# Cache
		ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible-galaxy-cache";
		BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle";
		CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv";
		EM_CACHE="${XDG_CACHE_HOME}/emscripten/cache";
		GOMODCACHE="${XDG_CACHE_HOME}/go/mod";
		ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority";
		KSCRIPT_CACHE_DIR="${XDG_CACHE_HOME}/kscript";
		KUBECACHEDIR="${XDG_CACHE_HOME}/kube";
		MYPY_CACHE_DIR="${XDG_CACHE_HOME}/mypy";
		NUGET_PACKAGES="${XDG_CACHE_HOME}/NuGetPackages";
		PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python";
		PYTHON_EGG_CACHE="${XDG_CACHE_HOME}/python-eggs";
		RUFF_CACHE_DIR="${XDG_CACHE_HOME}/ruff";
		SINGULARITY_CACHEDIR="${XDG_CACHE_HOME}/singularity";
		SOLARGRAPH_CACHE="${XDG_CACHE_HOME}/solargraph";
		STARSHIP_CACHE="${XDG_CACHE_HOME}/starship";
		TEXMFVAR="${XDG_CACHE_HOME}/texmf-var";
		XCOMPOSECACHE="${XDG_CACHE_HOME}/X11/xcompose";

		# Config
		ACKRC="${XDG_CONFIG_HOME}/ack/ackrc";
		ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible.cfg";
		ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}/asdf/asdfrc";
		AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config";
		AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials";
		AZURE_CONFIG_DIR="${XDG_CONFIG_HOME}/azure";
		BASH_COMPLETION_USER_FILE="${XDG_CONFIG_HOME}/bash-completion/bash_completion";
		BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle/config";
		CHKTEXRC="${XDG_CONFIG_HOME}/chktex";
		CIN_CONFIG="${XDG_CONFIG_HOME}/bcast5";
		DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker";
		DOT_SAGE="${XDG_CONFIG_HOME}/sage";
		EASYOCR_MODULE_PATH="${XDG_CONFIG_HOME}/EasyOCR";
		ELINKS_CONFIGDIR="${XDG_CONFIG_HOME}/elinks";
		EM_CONFIG="${XDG_CONFIG_HOME}/emscripten/config";
		GQRC="${XDG_CONFIG_HOME}/gqrc";
		GR_PREFS_PATH="${XDG_CONFIG_HOME}/gnuradio";
		GRC_PREFS_PATH="${XDG_CONFIG_HOME}/gnuradio/grc.conf";
		GTK_RC_FILES="${XDG_CONFIG_HOME}/gtk-1.0/gtkrc";
		GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc";
		HOUDINI_USER_PREF_DIR="${XDG_CACHE_HOME}/houdini__HVER__";
		INPUTRC="${XDG_CONFIG_HOME}/readline/inputrc";
		IRBRC="${XDG_CONFIG_HOME}/irb/irbrc";
#		_JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"; # Since the user will likely need to configure this, probably best not to preset it.
		JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter";
		KUBECONFIG="${XDG_CONFIG_HOME}/kube";
		K9SCONFIG="${XDG_CONFIG_HOME}/k9s";
		LYNX_CFG="${XDG_CONFIG_HOME}/lynx.cfg";
		MOST_INITFILE="${XDG_CONFIG_HOME}/mostrc";
		NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc";
		OCTAVE_SITE_INITFILE="${XDG_CONFIG_HOME}/octave/octaverc";
		PGSERVICEFILE="${XDG_CONFIG_HOME}/pg_service.conf";
		PSQLRC="${XDG_CONFIG_HOME}/pg/psqlrc";
		PYLINTRC="${XDG_CONFIG_HOME}/pylint/pylintrc";
		RECOLL_CONFDIR="${XDG_CONFIG_HOME}/recoll";
		REDISCLI_RCFILE="${XDG_CONFIG_HOME}/redisclirc";
		RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgrep/config";
		SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc";
		SINGULARITY_CONFIGDIR="${XDG_CONFIG_HOME}/singularity";
		SPACEMACSDIR="${XDG_CONFIG_HOME}/spacemacs";
		STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship.toml";
		TEXMFCONFIG="${XDG_CONFIG_HOME}/texlive/texmf-config";
		TRAVIS_CONFIG_PATH="${XDG_CONFIG_HOME}/travis";
		TS3_CONFIG_DIR="${XDG_CONFIG_HOME}/ts3client";
		UNCRUSTIFY_CONFIG="${XDG_CONFIG_HOME}/uncrustify/uncrustify.cfg";
		VIMPERATOR_INIT=":source ${XDG_CONFIG_HOME}/vimperator/vimperatorrc";
		VIMPERATOR_RUNTIME="${XDG_CONFIG_HOME}/vimperator";
		WGETRC="${XDG_CONFIG_HOME}/wgetrc";
		XCOMPOSEFILE="${XDG_CONFIG_HOME}/X11/xcompose";
		XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc";
		XSERVERRC="${XDG_CONFIG_HOME}/X11/xserverrc";
		X3270PRO="${XDG_CONFIG_HOME}/x3270/config";
		C3270PRO="${XDG_CONFIG_HOME}/c3270/config";
		ZDOTDIR="${XDG_CONFIG_HOME}/zsh";

		# Data
		ANSIBLE_HOME="${XDG_DATA_HOME}/ansible";
		ASDF_DATA_DIR="${XDG_DATA_HOME}/asdf";
		BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundle";
		BOGOFILTER_DIR="${XDG_DATA_HOME}/bogofilter";
		CARGO_HOME="${XDG_DATA_HOME}/cargo";
		CD_BOOKMARK_FILE="${XDG_DATA_HOME}/cd-bookmark/bookmarks";
		CGDB_DIR="${XDG_DATA_HOME}/cgdb";
		CONAN_USER_HOME="${XDG_DATA_HOME}/conan";
		DISCORD_USER_DATA_DIR="${XDG_DATA_HOME}/discord";
		DUB_HOME="${XDG_DATA_HOME}/dub";
		DVDCSS_CACHE="${XDG_DATA_HOME}/dvdcss";
		ELECTRUMDIR="${XDG_DATA_HOME}/electrum";
		ELM_HOME="${XDG_DATA_HOME}/elm";
		EM_PORTS="${XDG_DATA_HOME}/emscriptem/ports";
		FCEUX_HOME="${XDG_DATA_HOME}/fceux";
		FFMPEG_DATADIR="${XDG_DATA_HOME}/ffmpeg";
		GETIPLAYERUSERPREFS="${XDG_DATA_HOME}/get_iplayer";
		GNUPGHOME="${XDG_DATA_HOME}/gnupg";
		GOPATH="${XDG_DATA_HOME}/go";
		GPODDER_HOME="${XDG_DATA_HOME}/gpodder";
		GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle";
		GRIPHOME="${XDG_DATA_HOME}/grip";
		IMAPFILTER_HOME="${XDG_DATA_HOME}/imapfilter";
		IPFS_PATH="${XDG_DATA_HOME}/ipfs";
		JULIA_DEPOT_PATH="${XDG_DATA_HOME}/julia:$JULIA_DEPOT_PATH";
		JULIAUP_DEPOT_PATH="${XDG_DATA_HOME}/julia";
		LEDGER_FILE="${XDG_DATA_HOME}/hledger.journal";
		LEIN_HOME="${XDG_DATA_HOME}/lein";
		MACHINE_STORAGE_PATH="${XDG_DATA_HOME}/docker-machine";
		MATHEMATICA_USERBASE="${XDG_DATA_HOME}/mathematica";
		MAVEN_OPTS="-Dmaven.repo.local=${XDG_DATA_HOME}/maven/repository";
		MAXIMA_USERDIR="${XDG_DATA_HOME}/maxima";
		MEDNAFEN_HOME="${XDG_DATA_HOME}/mednafen";
		MINIKUBE_HOME="${XDG_DATA_HOME}/minikube";
		MPLAYER_HOME="${XDG_DATA_HOME}/mplayer";
		NODENV="${XDG_DATA_HOME}/nodenv";
		N_PREFIX="${XDG_DATA_HOME}/n-nodejs"; # Retarded single letter program name
		NVM_DIR="${XDG_DATA_HOME}/nvm";
		OLLAMA_MODELS="${XDG_DATA_HOME}/ollama/models";
		OMNISHARPHOME="${XDG_DATA_HOME}/omnisharp";
		OPAMROOT="${XDG_DATA_HOME}/opam";
		PARALLEL_HOME="${XDG_DATA_HOME}/parallel";
		PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass";
		PLATFORMIO_CORE_DIR="${XDG_DATA_HOME}/platformio";
		PLTUSERHOME="${XDG_DATA_HOME}/racket";
		PGPASSFILE="${XDG_CONFIG_HOME}/pg_pass";
		PYENV="${XDG_DATA_HOME}/pyenv";
		PYTHONUSERBASE="${XDG_DATA_HOME}/python";
		RBENV_ROOT="${XDG_DATA_HOME}/rbenv";
		RLWRAP_HOME="${XDG_DATA_HOME}/rlwrap";
		RUSTUP_HOME="${XDG_DATA_HOME}/rustup";
		R_HOME_USER="${XDG_DATA_HOME}/R-statistics";
		R_PROFILE_USER="${XDG_DATA_HOME}/R-statistics/profile";
#		TERMINFO="${XDG_DATA_HOME}/terminfo";
#		TERMINFO_DIRS="${XDG_DATA_HOME}/terminfo:${pkgs.ncurses}/share/terminfo";
		TEXMFHOME="${XDG_DATA_HOME}/texmf";
		TEXMACS_HOME_PATH="${XDG_DATA_HOME}/texmacs";
		UNISON="${XDG_DATA_HOME}/unison";
		VAGRANT_HOME="${XDG_DATA_HOME}/vagrant";
		VAGRANT_ALIAS_FILE="${XDG_DATA_HOME}/vagrant/aliases";
		VSCODE_PORTABLE="${XDG_DATA_HOME}/vscode";
		WAKATIME_HOME="${XDG_DATA_HOME}/wakatime";
		WINEPREFIX="${XDG_DATA_HOME}/wineprefixes/default";
		WORKON_HOME="${XDG_DATA_HOME}/virtualenvs";
		_Z_DATA="${XDG_DATA_HOME}/z-data"; # Can we please not with the single letter names

		# State
		CALCHISTFILE="${XDG_STATE_HOME}/calc_history";
		GQSTATE="${XDG_STATE_HOME}/gq-state";
		HISTFILE="${XDG_STATE_HOME}/shell-history";
		MYSQL_HISTFILE="${XDG_STATE_HOME}/mysql_history";
		NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_repl_history";
		OCTAVE_HISTFILE="${XDG_CACHE_HOME}/octave-hsts";
		PSQL_HISTORY="${XDG_STATE_HOME}/psql_history";
		PYTHON_HISTORY="${XDG_STATE_HOME}/python/history";
		REDISCLI_HISTFILE="${XDG_STATE_HOME}/rediscli_history";
		R_HISTFILE="${XDG_STATE_HOME}/R-statistics-history";
		W3M_DIR="${XDG_STATE_HOME}/w3m";

		# Misc
		GHCUP_USE_XDG_DIRS="true";
		GPODDER_DOWNLOAD_DIR="${XDG_DOWNLOAD_DIR}/gpodder";
		JUPYTER_PLATFORM_DIRS="1";
		MIX_XDG="true"; # Elixir
#		RXVT_SOCKET="${XDG_RUNTIME_DIR}/urxvtd";
		STACK_XDG="1"; # Haskell Stack
#		XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"; # Breaks LightDM

		PATH = [
			"${XDG_BIN_HOME}"
		];
	};
}

