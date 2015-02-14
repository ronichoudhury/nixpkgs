{
    packageOverrides = pkgs: rec {
        sqlalchemy = pkgs.buildPythonPackage rec {
            name = "sqlalchemy-0.9.8";
            src = pkgs.fetchurl {
                url = "https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-0.9.8.tar.gz";
                md5 = "470ca4da4a0081efc830f0d90dd91682";
            };

            buildInputs = with pkgs.pythonPackages; [
                mock
                pytest
            ];
            propagatedBuildInputs = [];
            doCheck = false;

            meta = {
                description = "SQLAlchemy";
                homepage = "http://www.sqlalchemy.org/";
                maintainers = [ "Roni Choudhury" ];
            };
        };

        tangelo = pkgs.buildPythonPackage {
            name = "tangelo-0.8.1";
            src = pkgs.fetchurl {
                url = "https://pypi.python.org/packages/source/t/tangelo/tangelo-0.8.1.tar.gz";
                md5 = "6ef8a6f4381861f8781abd24fdbec9a9";
            };

            propagatedBuildInputs = with pkgs.python27Packages; [
                cherrypy
                ws4py
                pyyaml
            ];
            doCheck = false;

            meta = {
                description = "Tangelo";
                homepage = "http://www.tangelohub.org/tangelo";
                maintainers = [ "Roni Choudhury" ];
            };
        };

        ws4py = pkgs.buildPythonPackage rec {
            name = "ws4py-0.3.2";

            src = pkgs.fetchurl {
                url = "https://pypi.python.org/packages/source/w/ws4py/ws4py-0.3.2.tar.gz";
                md5 = "22fc2d79734473aa5cbb489161842354";
            };

            # python zip complains about old timestamps
            #preConfigure = ''
              #find -print0 | xargs -0 touch
            #'';

            # Tests depend on other packages
            doCheck = false;

            meta = {
                homepage = https://ws4py.readthedocs.org;
                description = "A WebSocket package for Python";
                maintainers = [ "Roni Choudhury" ];
            };
        };

        tangelo-git = pkgs.callPackage ./tangelo-git { };

        virtualenv = pkgs.buildPythonPackage rec {
          name = "virtualenv-12.0.7";
          src = pkgs.fetchurl {
            url = "http://pypi.python.org/packages/source/v/virtualenv/${name}.tar.gz";
            md5 = "e08796f79d112f3bfa6653cc10840114";
          };

          # pythonPath = [ self.recursivePthLoader ];

          patches = [ virtualenv/virtualenv-change-prefix.patch ];

          propagatedBuildInputs = with pkgs.python27Packages; [
            readline
            sqlite3
            curses
          ];

          buildInputs = with pkgs.python27Packages; [
            mock
            nose
          ];

          doCheck = false;

          meta = {
            description = "a tool to create isolated Python environments";
            homepage = http://www.virtualenv.org;
            license = pkgs.stdenv.lib.licenses.mit;
            maintainers = [ "Roni Choudhury" ];
          };
        };
    };
}
