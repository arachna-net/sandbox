git log --oneline \                                                                      ✔  10193  20:50:23
  | cut -f 1 -d' ' \
  | (while read commit ; do
       other_branches="$(git branch --contains $commit | egrep -v '^\* ')"
       if [ -n "${other_branches}" ] ; then
         echo -e "${commit} is in:\n${other_branches}"
         break
       fi
     done)
