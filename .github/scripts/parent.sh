git log --source origin --oneline \
  | cut -f 1 -d' ' \
  | (while read commit ; do
       other_branches="$(git branch --contains $commit | egrep -v '^\* ')"
       if [ -n "${other_branches}" ] ; then
         echo "${other_branches}"
         break
       fi
     done) | xargs
