# how to use, for example:
docker run -e SVN_REPO_PATH=/svn_repo  -e SVN_REPO_NAME=test  -v /home/ubuntu/svn_repo:/svn_repo   -p 10009:80 -d  --name svn  svn