printf "The current branch is:  $TRAVIS_BRANCH \n"
if [ "$TRAVIS_BRANCH" = "master" ]
then
  printf "Pushing to staging \n"
  export GH_REF="github.com/offcourse/offcourse-info.git"
elif [ "$TRAVIS_BRANCH" = "production" ]
then
  printf "Pushing to production \n"
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