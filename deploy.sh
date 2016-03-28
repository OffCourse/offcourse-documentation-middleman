echo "The current branch is:  ${TRAVIS_BRANCH}   "
if [ $TRAVIS_BRANCH -eq "master"]
then
  echo "Pushing to staging!!!"
  GH_REF = "github.com/offcourse/offcourse-info.git"
elif [ $TRAVIS_BRANCH -eq "production" ]
then
  echo "Pushing to production!!!"
  GH_REF = "github.com/offcourse/offcourse-info.git"
fi

cp .nojekyll build/.nojekyll
echo info-staging.offcourse.io > build/CNAME
cd build
git init
git config user.name "Zaturrby"
git config user.email "rjkorteschiel@gmail.com"
git status
git add -A
git status
git commit -m "deploy"
git status
git push -f --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
git status