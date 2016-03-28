echo "The current branch is:  $TRAVIS_BRANCH   "
if [ "$TRAVIS_BRANCH" = "master" ]
then
  echo "Pushing to staging!!!"
  export GH_REF="github.com/offcourse/offcourse-info.git"
elif [ "$TRAVIS_BRANCH" = "production" ]
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
git add -A
git commit -m "deploy"
git push -f --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1