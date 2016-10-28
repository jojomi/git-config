

# add


<a name="a"></a>
## git a<a name="a"></a>

add

**Example:**

    >>> git a image.png

**Example:**

    >>> git a .

**Implementation:**

    a = add


<a name="ai"></a>
## git ai<a name="ai"></a>

add files interactively (file-based)

**Example:**

    >>> git ai
    staged     unstaged path
    1:    unchanged        +7/-1 .gitconfig.d/alias/add
    
    *** Commands ***
    1: status	  2: update	  3: revert	  4: add untracked
    5: patch	  6: diff	  7: quit	  8: help
    What now>

**Implementation:**

    ai = add --interactive


<a name="ap"></a>
## git ap<a name="ap"></a>

add files patch-based

**Example:**

    >>> git ap
    diff --git a/.gitconfig.d/alias/add b/.gitconfig.d/alias/add
    index 39b0929..b2c86c7 100644
    --- a/.gitconfig.d/alias/add
    +++ b/.gitconfig.d/alias/add
    @@ -1,7 +1,22 @@
    [alias]
    -  # removed line
    +  # added line
    Stage this hunk [y,n,q,a,d,/,s,e,?]?

**Implementation:**

    ap = add --patch


<a name="as"></a>
## git as<a name="as"></a>

include status after adding

**See:** [git a](#a)

**Implementation:**

    as = !git a "$@" && git s


<a name="ais"></a>
## git ais<a name="ais"></a>

include status after adding interactively

**See:** [git ai](#ai)

**Implementation:**

    ais = !git ai "$@" && git s


<a name="aps"></a>
## git aps<a name="aps"></a>

include status after adding patch-based

**See:** [git ap](#ap)

**Implementation:**

    aps = !git ap "$@" && git s


# checkout


<a name="cop"></a>
## git cop<a name="cop"></a>

checkout patch-based

**Example:**

    >>> git cop
    diff --git a/.gitconfig.d/alias/add b/.gitconfig.d/alias/add
    index dc45b66..6425264 100644
    --- a/.gitconfig.d/alias/add
    +++ b/.gitconfig.d/alias/add
    @@ -15,7 +15,7 @@
    random
    existing lines
    
    -  old line
    +  new line
    unchanged content
    
    Stage this hunk [y,n,q,a,d,/,e,?]?

**Implementation:**

    cop = checkout --patch


<a name="ours"></a>
## git ours<a name="ours"></a>

checkout a file by using our state

**Example:**

    >>> git ours index.html

**Implementation:**

    ours = !sh -c 'git checkout --ours $@ && git add "$@"' -


<a name="theirs"></a>
## git theirs<a name="theirs"></a>

checkout a file by using their state

**Example:**

    >>> git theirs index.html

**Implementation:**

    theirs = !sh -c 'git checkout --theirs $@ && git add "$@"' -


# commit


<a name="c"></a>
## git c<a name="c"></a>

commit

**Example:**

    >>> git c

**Implementation:**

    c = commit --verbose


<a name="cm"></a>
## git cm<a name="cm"></a>

commit with message

**Example:**

    >>> git cm 'my commit message'

**Implementation:**

    cm = commit --verbose --message


<a name="ca"></a>
## git ca<a name="ca"></a>

commit after adding all pending changes

**Example:**

    >>> git ca

**Implementation:**

    ca = commit --verbose --all


<a name="cam"></a>
## git cam<a name="cam"></a>

commit after with message adding all pending changes

**Example:**

    >>> git cam 'my commit message'

**Implementation:**

    cam = commit --verbose --all --message


<a name="cp"></a>
## git cp<a name="cp"></a>

commit patch-based

**Example:**

    >>> git cp
    diff --git a/.gitconfig.d/alias/add b/.gitconfig.d/alias/add
    index dc45b66..6425264 100644
    --- a/.gitconfig.d/alias/add
    +++ b/.gitconfig.d/alias/add
    @@ -15,7 +15,7 @@
    content
    content
    
    -  remove content
    +  add content
    content
    content
    content
    Stage this hunk [y,n,q,a,d,/,e,?]?

**Implementation:**

    cp = commit --patch


# diff


<a name="d"></a>
## git d<a name="d"></a>

diff

**Example:**

    >>> git d

**Implementation:**

    d = diff


<a name="word-diff"></a>
## git word-diff<a name="word-diff"></a>

word diff (can keep small changes oneline)

**Example:**

    >>> git word-diff

**Implementation:**

    word-diff = diff --word-diff=color


<a name="wd"></a>
## git wd<a name="wd"></a>


= [git word-diff](#word-diff)

**Implementation:**

    wd = !git wdiff


<a name="diff-staged"></a>
## git diff-staged<a name="diff-staged"></a>

show diff for staged changes (vs. HEAD)

**Example:**

    >>> git diff-staged

**Implementation:**

    diff-staged = diff --cached


<a name="ds"></a>
## git ds<a name="ds"></a>


= [git staged](#staged)

**Implementation:**

    ds = !git staged


# fetch


<a name="fetchall"></a>
## git fetchall<a name="fetchall"></a>

fetch all items while pruning obsolete items

**Implementation:**

    fetchall = fetch --verbose --all --prune


<a name="fa"></a>
## git fa<a name="fa"></a>


= [git fetchall](#fetchall)

**Implementation:**

    fa = !git fetchall


# helper


<a name="current-branch-name"></a>
## git current-branch-name<a name="current-branch-name"></a>

get current branch name

**Example:**

    >>> git current-branch-name
    master

**Implementation:**

    current-branch-name = rev-parse --abbrev-ref HEAD


<a name="master-branch-name"></a>
## git master-branch-name<a name="master-branch-name"></a>

get name of the main branch of a project
(usually master, use GIT_MASTER_BRANCH environment variable to change)

**Example:**

    >>> git master-branch-name
    master

**Implementation:**

    master-branch-name = !sh -c 'echo ${GIT_MASTER_BRANCH:-master}' -


<a name="current-commit-hash"></a>
## git current-commit-hash<a name="current-commit-hash"></a>

get current commit hash (full sha1)

**Example:**

    >>> git current-commit-hash
    c9f997a66e6748f34e3311bff5af8795e43c0d2a

**Implementation:**

    current-commit-hash = rev-parse HEAD


<a name="current-commit-hash-short"></a>
## git current-commit-hash-short<a name="current-commit-hash-short"></a>

get current commit hash (short)

**Example:**

    >>> git current-commit-hash-short
    c9f997a

**Implementation:**

    current-commit-hash-short = rev-parse --short HEAD


<a name="stashed"></a>
## git stashed<a name="stashed"></a>


**Example:**

    >>> ecute a git command with current changes being auto-stashed and restored (if command is successful)

**Example:**

    >>> git stashed checkout master

**Implementation:**

    stashed = !sh -c \"LC_ALL=C git stash save | grep 'No local changes to save' && git $* || (git $* && git stash pop)\" -


<a name="fork-commit"></a>
## git fork-commit<a name="fork-commit"></a>

get commit hash of the fork point between two branches (default master branch and HEAD)

**Example:**

    >>> git fork-commit
    ce79421a281912534bba53191a0bbd223a4e9c21

**Example:**

    >>> git fork-commit master my-feature
    c9f997a66e6748f34e3311bff5af8795e43c0d2a

**Implementation:**

    fork-commit = !sh -c 'git merge-base --fork-point "${1:-$(git master-branch-name)}" "${2:-HEAD}"' -


<a name="initial-commit-hash"></a>
## git initial-commit-hash<a name="initial-commit-hash"></a>

get hash of the project's initial commit

**Example:**

    >>> git initial-commit-hash
    d496667a42425c45d31f81a41a4e24afc8e28e49

**Implementation:**

    initial-commit-hash = !sh -c 'rev-list --max-parents=0 $(git master-branch-name)' -


<a name="oldest-autosquash-commit"></a>
## git oldest-autosquash-commit<a name="oldest-autosquash-commit"></a>

get commit hash of the oldest commit with a commit messages starting with "fixup!" or "squash!"

**Example:**

    >>> git oldest-autosquash-commit
    ce79421a281912534bba53191a0bbd223a4e9c21

**Implementation:**

    oldest-autosquash-commit = !sh -c \"git log --pretty=%H --grep='^fixup!' --grep '^squash!' | tail -1\" -


<a name="tracking-branch-name"></a>
## git tracking-branch-name<a name="tracking-branch-name"></a>

get name of the tracking branch associated with the current branch

**Example:**

    >>> git tracking-branch-name
    origin/master

**Example:**

    >>> git tracking-branch-name my-feature
    origin/features/my-feature

**Implementation:**

    tracking-branch-name = !sh -c 'git rev-parse --abbrev-ref --symbolic-full-name {1:-$(git current-branch-name)}@{upstream}' -


# log


<a name="# show log of last n commits, defaults to n"></a>
## git # show log of last n commits, defaults to n<a name="# show log of last n commits, defaults to n"></a>


**Implementation:**

    # show log of last n commits, defaults to n=5


<a name="l"></a>
## git l<a name="l"></a>


**See:** [git ll](#ll)

**Example:**

    >>> git l
    * 7b99cc1 - (HEAD, master) add documentation (vor 14 Minuten) <jojomi>
    * c9f997a - documentation infrastructure (vor 32 Minuten) <jojomi>
    * dc1a9ec - Improve path generation on bootstrapping (vor 7 Wochen) <jojomi>
    * 100c8ab - Add project structure (vor 7 Wochen) <jojomi>
    * d496667 - Initial commit (vor 9 Wochen) <jojomi>

**Example:**

    >>> git l 2
    * 7b99cc1 - (HEAD, master) add documentation (vor 14 Minuten) <jojomi>
    * c9f997a - documentation infrastructure (vor 32 Minuten) <jojomi>

**Implementation:**

    l = !sh -c 'git ll -${1:-5}' -


<a name="ll"></a>
## git ll<a name="ll"></a>

nicely format log (oneline with tree, hash, message, author, date, and colors)

**Example:**

    >>> git ll
    * d496667 - Initial commit (vor 9 Wochen) <jojomi>

**Implementation:**

    ll = log --color --graph --pretty=format:'%C(bold green)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit


<a name="log-branch"></a>
## git log-branch<a name="log-branch"></a>

log vs. "master" (which commits are not on "master" yet?)

**Example:**

    >>> git log-branch

**Example:**

    >>> git log-branch my-feature

**Implementation:**

    log-branch = !sh -c '$ROOT_DIR/.gitconfig.d/alias/scripts/log-branch ${1:-HEAD}' -


<a name="lb"></a>
## git lb<a name="lb"></a>

log commits on this branch only (since fork)

**Example:**

    >>> git lb

**See:** [git log-branch](#log-branch)

**Implementation:**

    lb = !git log-branch


<a name="log-me"></a>
## git log-me<a name="log-me"></a>

log only commits made by me (formatted like `git ll`)

**Example:**

    >>> git log-me -1
    * 7b99cc1 - (HEAD, master) add documentation (vor 14 Minuten) <jojomi>

**Implementation:**

    log-me = !UN=$(git config user.name) && git ll --author="\"$UN\"" "$@"


<a name="new"></a>
## git new<a name="new"></a>

new commits created by the last command (formatted like `git ll`)

**Example:**

    >>> git new

**See:** [git git update](#git update)

**See:** [git git ll](#git ll)

**Implementation:**

    new = !sh -c 'git ll $1@{1}..$1@{0} "$@"' -


<a name="current-heads"></a>
## git current-heads<a name="current-heads"></a>

show commit hashes of the HEADs of branches

**Example:**

    >>> git current-heads
    c9f997a HEAD
    c9f997a refs/heads/master
    1eab44e refs/remotes/origin/HEAD
    1eab44e refs/remotes/origin/master

**Implementation:**

    current-heads = show-ref --head --abbrev


# merge


<a name="m"></a>
## git m<a name="m"></a>

merge

**Example:**

    >>> git m

**Implementation:**

    m = merge


<a name="mnf"></a>
## git mnf<a name="mnf"></a>

merge preventing fast-forward

**Example:**

    >>> git mnf

**Implementation:**

    mnf = merge --no-ff


<a name="mf"></a>
## git mf<a name="mf"></a>

merge forcing fast-forward

**Example:**

    >>> git mf

**Implementation:**

    mf = merge --ff-only


<a name="mergeto"></a>
## git mergeto<a name="mergeto"></a>

inverted merging (being on target branch) without specifying fast-forward style

**Example:**

    >>> git mergeto master

**Implementation:**

    mergeto = !sh -c 'SOURCE=$(git current-branch-name) && DEST=${1:-$(git master-branch-name)} && git checkout $DEST && git upd && git merge $MERGE_PARAMS $SOURCE && git ll $(git fork-commit $DEST $SOURCE)~2.. && echo -e "Merged `tput bold`$SOURCE `tput sgr0`to `tput bold`$DEST`tput sgr0`. Use `tput bold`git kill-branch $SOURCE `tput sgr0`to remove source branch if merge succeeded."' -


<a name="mergetonf"></a>
## git mergetonf<a name="mergetonf"></a>

inverted merging (being on target branch) without fast-forwarding

**Example:**

    >>> git mergetonf master

**Implementation:**

    mergetonf = !sh -c 'MERGE_PARAMS="--no-ff" git mergeto' -


<a name="mergetoff"></a>
## git mergetoff<a name="mergetoff"></a>

inverted merging (being on target branch) forcing fast-forward

**Example:**

    >>> git mergetoff master

**Implementation:**

    mergetoff = !sh -c 'MERGE_PARAMS="--ff-only" git mergeto' -


<a name="mtonf"></a>
## git mtonf<a name="mtonf"></a>


= [git mergetonf](#mergetonf)

**Implementation:**

    mtonf = !sh -c 'git mergeto' -    # also see graft from git-extras


<a name="mtoff"></a>
## git mtoff<a name="mtoff"></a>


= [git mergetoff](#mergetoff)

**Implementation:**

    mtoff = !sh -c 'git mergetoff' -


<a name="cleanorig"></a>
## git cleanorig<a name="cleanorig"></a>

remove .orig files created while merge conflicts

**Example:**

    >>> git cleanorig

**Implementation:**

    cleanorig = !find . -name '*.orig' -delete


# pull


<a name="pl"></a>
## git pl<a name="pl"></a>

pull

**Example:**

    >>> git pl

**Implementation:**

    pl = pull


<a name="pul"></a>
## git pul<a name="pul"></a>

pull

**Example:**

    >>> git pul

**Implementation:**

    pul = pull


<a name="pur"></a>
## git pur<a name="pur"></a>

pull with rebase instead of merge

**Example:**

    >>> git pur

**Implementation:**

    pur = pull --rebase


<a name="update"></a>
## git update<a name="update"></a>

make your repo up-to-date and show new commits added

**Example:**

    >>> git update

**Implementation:**

    update = !sh -c ': git pull && git fetch --all && git pull --rebase --prune "$@" && git submodule update --init --recursive && git new'


<a name="up"></a>
## git up<a name="up"></a>


= [git update](#update)

**Implementation:**

    up = !git update


# push


<a name="ps"></a>
## git ps<a name="ps"></a>

push

**Example:**

    >>> git ps

**Implementation:**

    ps = push


<a name="pus"></a>
## git pus<a name="pus"></a>

push

**Example:**

    >>> git pus

**Implementation:**

    pus = push


<a name="pf"></a>
## git pf<a name="pf"></a>

force push (attention: may create huge chaos)

**Example:**

    >>> git pf

**Implementation:**

    pf = push --force


# rebase


<a name="rbi"></a>
## git rbi<a name="rbi"></a>

rebase current branch (assume being forked from master)

**Example:**

    >>> git rbi

**Example:**

    >>> git rbi 6fcc9b2

**Implementation:**

    rbi = !sh -c 'git rebase --interactive ${1:-$(git fork-commit)}' -


<a name="rbih"></a>
## git rbih<a name="rbih"></a>

rebase n revisions from HEAD (default 3)

**Example:**

    >>> git rbih

**Example:**

    >>> git rbih 10

**Implementation:**

    rbih = !sh -c 'git rbi HEAD~${1:-3}' -


<a name="rba"></a>
## git rba<a name="rba"></a>

rebase automatically (find oldest commit to be fixupped or squashed)

**Example:**

    >>> git rba

**Implementation:**

    rba = !sh -c 'HASH=$(git oldest-autosquash-commit) && git rbi $(git fork-commit)' -


<a name="fix"></a>
## git fix<a name="fix"></a>

fixup specific commit (default HEAD)

**Example:**

    >>> git fix

**Example:**

    >>> git fix aa861e2

**Implementation:**

    fix = !sh -c 'git commit --fixup=${1:-HEAD}' -


<a name="fix-rebase"></a>
## git fix-rebase<a name="fix-rebase"></a>

fixup specific commit and initiate rebase on that commit so that the fixup can quickly be applied

**Example:**

    >>> git fix-rebase

**Example:**

    >>> git fix-rebase 6257bdb

**See:** [git fix](#fix)

**Implementation:**

    fix-rebase = !sh -c 'HASH=$(git rev-parse ${1:-HEAD}) && PARENT_HASH=$(git rev-parse $HASH~1) && echo "fixing commit $HASH" && echo "rebasing onto $PARENT_HASH" && git fix $HASH && git rebase --interactive $PARENT_HASH' -


<a name="fr"></a>
## git fr<a name="fr"></a>


= [git fix-rebase](#fix-rebase)

**Implementation:**

    fr = !git fix-rebase


<a name="fix-instant"></a>
## git fix-instant<a name="fix-instant"></a>

fix a commit and instantly rebase to it (no questions asked)

**Example:**

    >>> git fix-instant

**Example:**

    >>> git fix-instant d199090

**See:** [git fix](#fix)

**See:** [git fix-rebase](#fix-rebase)

**Implementation:**

    fix-instant = !sh -c 'export GIT_EDITOR=true && HASH=$(git rev-parse ${1:-HEAD}) && PARENT_HASH=$(git rev-parse $HASH~1) && echo "fixing commit $HASH" && echo "rebasing onto $PARENT_HASH" && git fix $HASH && git rebase --interactive $PARENT_HASH' -


<a name="fi"></a>
## git fi<a name="fi"></a>


= [git fix-instant](#fix-instant)

**Implementation:**

    fi = !git fix-instant


# reset


<a name="r"></a>
## git r<a name="r"></a>

reset

**Example:**

    >>> git r

**Implementation:**

    r = reset


<a name="rh"></a>
## git rh<a name="rh"></a>

reset hard

**Example:**

    >>> git rh

**Implementation:**

    rh = reset --hard


<a name="reset-hard-origin"></a>
## git reset-hard-origin<a name="reset-hard-origin"></a>

reset hard (to origin)

**Example:**

    >>> git reset-hard-origin

**Implementation:**

    reset-hard-origin = !sh -c 'REMOTE_BRANCH=$(git rev-parse --abbrev-ref --symbolic-full-name @{u}) && git reset --hard $REMOTE_BRANCH' -


<a name="reset-hard-tracking"></a>
## git reset-hard-tracking<a name="reset-hard-tracking"></a>

reset hard (to tracking branch)

**Example:**

    >>> git reset-hard-tracking

**Implementation:**

    reset-hard-tracking = !sh -c 'git reset --hard $(git tracking-branch-name)' -


<a name="rho"></a>
## git rho<a name="rho"></a>


= [git reset-hard-origin](#reset-hard-origin)

**Implementation:**

    rho = !git reset-hard-origin


<a name="rht"></a>
## git rht<a name="rht"></a>


= [git reset-hard-tracking](#reset-hard-tracking)

**Implementation:**

    rht = !git reset-hard-tracking


# review


<a name="diff-since-fork"></a>
## git diff-since-fork<a name="diff-since-fork"></a>

show diff since fork

**Example:**

    >>> git diff-since-fork

**Example:**

    >>> git diff-since-fork master my-feature

**Implementation:**

    diff-since-fork = !sh -c 'git diff $(git fork-commit "${1:-$(git master-branch-name)}" "${2:-HEAD}").."${2:-HEAD}"' -


<a name="word-diff-since-fork"></a>
## git word-diff-since-fork<a name="word-diff-since-fork"></a>

show word-based diff since fork

**Example:**

    >>> git word-diff-since-fork

**Example:**

    >>> git word-diff-since-fork master my-feature

**Implementation:**

    word-diff-since-fork = !sh -c 'git wdiff $(git fork-commit "${1:-$(git master-branch-name)}" "${2:-HEAD}").."${2:-HEAD}"' -


<a name="files-changed-since-fork"></a>
## git files-changed-since-fork<a name="files-changed-since-fork"></a>

show files changed since fork

**Example:**

    >>> files-changed-since-fork

**Example:**

    >>> files-changed-since-fork master my-feature

**Implementation:**

    files-changed-since-fork = !sh -c 'git diff --name-only $(git fork-commit "${1:-$(git master-branch-name)}" "${2:-HEAD}").."${2:-HEAD}"' -


<a name="remove-branch"></a>
## git remove-branch<a name="remove-branch"></a>

remove branch

**Example:**

    >>> git remove-branch my-feature

**Implementation:**

    remove-branch = !sh -c 'git branch -d ${1}'


<a name="rmb"></a>
## git rmb<a name="rmb"></a>


= [git remove-branch](#remove-branch)

**Implementation:**

    rmb = !git remove-branch


<a name="remove-branch-with-tracking"></a>
## git remove-branch-with-tracking<a name="remove-branch-with-tracking"></a>

remove branch including tracked branch

**Example:**

    >>> git remove-branch my-feature

**Implementation:**

    remove-branch-with-tracking = !sh -c 'git branch --remotes --delete $(git tracking-branch-name ${1}) && git remove-branch ${1}' -


<a name="rmbt"></a>
## git rmbt<a name="rmbt"></a>


= [git remove-branch-with-tracking](#remove-branch-with-tracking)

**Implementation:**

    rmbt = !git remove-branch-with-tracking


<a name="remove-tag"></a>
## git remove-tag<a name="remove-tag"></a>

remove tag

**Example:**

    >>> git remove-tag v0.4

**Implementation:**

    remove-tag = !sh -c 'git tag -d ${1}'


<a name="rmt"></a>
## git rmt<a name="rmt"></a>


= [git remove-tag](#remove-tag)

**Implementation:**

    rmt = !git remove-tag


<a name="remove-tag-with-remote"></a>
## git remove-tag-with-remote<a name="remove-tag-with-remote"></a>

remove tag including remote tag of with name

**Example:**

    >>> git remove-tag-with-remote v0.4

**Implementation:**

    remove-tag-with-remote = !sh -c 'git push ${2:-origin} :refs/tags/${1} && git remote-tag ${1}' -


<a name="rmtr"></a>
## git rmtr<a name="rmtr"></a>


= [git remove-tag-with-remote](#remove-tag-with-remote)

**Implementation:**

    rmtr = !git remove-tag-with-remote


# short


<a name="s"></a>
## git s<a name="s"></a>

status

**Implementation:**

    s = status


<a name="l"></a>
## git l<a name="l"></a>

log

**Implementation:**

    l = log


<a name="d"></a>
## git d<a name="d"></a>

diff

**Implementation:**

    d = diff


<a name="a"></a>
## git a<a name="a"></a>

add

**Implementation:**

    a = add


<a name="c"></a>
## git c<a name="c"></a>

commit

**Implementation:**

    c = commit


<a name="b"></a>
## git b<a name="b"></a>

branch

**Implementation:**

    b = branch


<a name="m"></a>
## git m<a name="m"></a>

merge

**Implementation:**

    m = merge


<a name="f"></a>
## git f<a name="f"></a>

fetch

**Implementation:**

    f = fetch


<a name="r"></a>
## git r<a name="r"></a>

reset

**Implementation:**

    r = reset


<a name="t"></a>
## git t<a name="t"></a>

tag

**Implementation:**

    t = tag


<a name="g"></a>
## git g<a name="g"></a>

grep

**Implementation:**

    g = grep


<a name="i"></a>
## git i<a name="i"></a>

init

**Implementation:**

    i = init


<a name="p"></a>
## git p<a name="p"></a>

pull

**Implementation:**

    p = pull


<a name="ps"></a>
## git ps<a name="ps"></a>

push

**Implementation:**

    ps = push


<a name="sh"></a>
## git sh<a name="sh"></a>

show

**Implementation:**

    sh = show


<a name="cl"></a>
## git cl<a name="cl"></a>

clone

**Implementation:**

    cl = clone


<a name="co"></a>
## git co<a name="co"></a>

checkout

**Implementation:**

    co = checkout


<a name="rb"></a>
## git rb<a name="rb"></a>

rebase

**Implementation:**

    rb = rebase


<a name="st"></a>
## git st<a name="st"></a>

stash

**Implementation:**

    st = stash


<a name="bi"></a>
## git bi<a name="bi"></a>

bisect

**Implementation:**

    bi = bisect


<a name="ch"></a>
## git ch<a name="ch"></a>

cherry-pick

**Implementation:**

    ch = cherry-pick


<a name="bl"></a>
## git bl<a name="bl"></a>

blame

**Implementation:**

    bl = blame


<a name="ar"></a>
## git ar<a name="ar"></a>

archive

**Implementation:**

    ar = archive


<a name="desc"></a>
## git desc<a name="desc"></a>

describe

**Implementation:**

    desc = describe


# stash


<a name="sl"></a>
## git sl<a name="sl"></a>

list stashes

**Example:**

    >>> git sl

**Implementation:**

    sl = stash list


<a name="sa"></a>
## git sa<a name="sa"></a>

apply stash

**Example:**

    >>> git sa

**Implementation:**

    sa = stash apply


<a name="ss"></a>
## git ss<a name="ss"></a>

save stash

**Example:**

    >>> git ss

**Implementation:**

    ss = stash save


<a name="sp"></a>
## git sp<a name="sp"></a>

pop stash

**Example:**

    >>> git sp

**Implementation:**

    sp = stash pop


<a name="snapshot"></a>
## git snapshot<a name="snapshot"></a>

snapshot current state

**Example:**

    >>> git snapshot

**Implementation:**

    snapshot = !git stash save "snapshot: $(date)" && git stash apply "stash@{0}"


<a name="sn"></a>
## git sn<a name="sn"></a>


= [git snapshot](#snapshot)

**Implementation:**

    sn = !git snapshot


# status


<a name="s"></a>
## git s<a name="s"></a>

short status

**Example:**

    >>> git s

**Implementation:**

    s = status --short --branch


<a name="st"></a>
## git st<a name="st"></a>

more verbose status

**Example:**

    >>> git st

**Implementation:**

    st = status --branch


<a name="overview"></a>
## git overview<a name="overview"></a>

overview, parameter: number of log entries [default 3]

**Example:**

    >>> git overview

**Implementation:**

    overview = !sh -c '(git describe 2>/dev/null || echo "no tag") && git s && echo "" && (git lb | head -n ${1:-3} && echo "")' -


<a name="o"></a>
## git o<a name="o"></a>


= [git overview](#overview)

**Implementation:**

    o = !git overview


<a name="overview-diff"></a>
## git overview-diff<a name="overview-diff"></a>

overview including working dir diff, parameter: number of log entries [default 3]

**Example:**

    >>> git overview-diff

**Implementation:**

    overview-diff = !sh -c 'git o "$@" && echo "" && git diff HEAD^..' -


<a name="od"></a>
## git od<a name="od"></a>


= [git overview-diff](#overview-diff)

**Implementation:**

    od = !git overview-diff


<a name="where"></a>
## git where<a name="where"></a>

show current branch and HEAD commit including commit message ("where am I?")

**Example:**

    >>> git overview-diff

**Implementation:**

    where = !sh -c 'printf "%-14s" "Branch:" && git current-branch-name && printf "%-14s" "HEAD commit:" && git l 1' -


<a name="w"></a>
## git w<a name="w"></a>


= [git where](#where)

**Implementation:**

    w = !git where


# tracking


<a name="track"></a>
## git track<a name="track"></a>

checkout a branch from a remote (default origin) as a tracking branch

**Example:**

    >>> git track your-feature

**Implementation:**

    track = !sh -c 'git checkout -t ${2:-origin}/${1}' -


<a name="tr"></a>
## git tr<a name="tr"></a>


= [git track](#track)

**Implementation:**

    tr = !git track


<a name="publish"></a>
## git publish<a name="publish"></a>

publish a branch (default current) to a remote (default origin)

**Example:**

    >>> git publish

**Implementation:**

    publish = !sh -c 'git push --set-upstream ${2:-origin} ${1:-$(git current-branch-name)}' -


<a name="pub"></a>
## git pub<a name="pub"></a>


= [git publish](#publish)

**Implementation:**

    pub = !git publish
