# add
<table>
<tr><td><strong>git a</strong></td><td>add</td></tr>
<tr><td><strong>git ai</strong></td><td>add files interactively (file-based)</td></tr>
<tr><td><strong>git ap</strong></td><td>add files patch-based</td></tr>
<tr><td><strong>git as</strong></td><td>include status after adding</td></tr>
<tr><td><strong>git ais</strong></td><td>include status after adding interactively</td></tr>
<tr><td><strong>git aps</strong></td><td>include status after adding patch-based</td></tr>
</table>

# checkout
<table>
<tr><td><strong>git cop</strong></td><td>checkout patch-based</td></tr>
<tr><td><strong>git ours</strong></td><td>checkout a file by using our state</td></tr>
<tr><td><strong>git theirs</strong></td><td>checkout a file by using their state</td></tr>
</table>

# commit
<table>
<tr><td><strong>git c</strong></td><td>commit</td></tr>
<tr><td><strong>git cm</strong></td><td>commit with message</td></tr>
<tr><td><strong>git ca</strong></td><td>commit after adding all pending changes</td></tr>
<tr><td><strong>git cam</strong></td><td>commit after with message adding all pending changes</td></tr>
<tr><td><strong>git cp</strong></td><td>commit patch-based</td></tr>
</table>

# diff
<table>
<tr><td><strong>git d</strong></td><td>diff</td></tr>
<tr><td><strong>git word-diff</strong></td><td>word diff (can keep small changes oneline)</td></tr>
<tr><td><strong>git wd</strong></td><td>↪ word-diff</td></tr>
<tr><td><strong>git diff-staged</strong></td><td>show diff for staged changes (vs. HEAD)</td></tr>
<tr><td><strong>git ds</strong></td><td>↪ staged</td></tr>
</table>

# fetch
<table>
<tr><td><strong>git fetchall</strong></td><td>fetch all items while pruning obsolete items</td></tr>
<tr><td><strong>git fa</strong></td><td>↪ fetchall</td></tr>
</table>

# helper
<table>
<tr><td><strong>git current-branch-name</strong></td><td>get current branch name</td></tr>
<tr><td><strong>git master-branch-name</strong></td><td>get name of the main branch of a project</td></tr>
<tr><td><strong>git current-commit-hash</strong></td><td>get current commit hash (full sha1)</td></tr>
<tr><td><strong>git current-commit-hash-short</strong></td><td>get current commit hash (short)</td></tr>
<tr><td><strong>git stashed</strong></td><td></td></tr>
<tr><td><strong>git fork-commit</strong></td><td>get commit hash of the fork point between two branches (default master branch and HEAD)</td></tr>
<tr><td><strong>git initial-commit-hash</strong></td><td>get hash of the project's initial commit</td></tr>
<tr><td><strong>git oldest-autosquash-commit</strong></td><td>get commit hash of the oldest commit with a commit messages starting with "fixup!" or "squash!"</td></tr>
<tr><td><strong>git tracking-branch-name</strong></td><td>get name of the tracking branch associated with the current branch</td></tr>
</table>

# log
<table>
<tr><td><strong>git l</strong></td><td>show log of last n commits, defaults to n=5</td></tr>
<tr><td><strong>git ll</strong></td><td>nicely format log (oneline with tree, hash, message, author, date, and colors)</td></tr>
<tr><td><strong>git log-branch</strong></td><td>log vs. "master" (which commits are not on "master" yet?)</td></tr>
<tr><td><strong>git lb</strong></td><td>log commits on this branch only (since fork)</td></tr>
<tr><td><strong>git log-me</strong></td><td>log only commits made by me (formatted like `git ll`)</td></tr>
<tr><td><strong>git new</strong></td><td>new commits created by the last command (formatted like `git ll`)</td></tr>
<tr><td><strong>git current-heads</strong></td><td>show commit hashes of the HEADs of branches</td></tr>
</table>

# merge
<table>
<tr><td><strong>git m</strong></td><td>merge</td></tr>
<tr><td><strong>git mnf</strong></td><td>merge preventing fast-forward</td></tr>
<tr><td><strong>git mf</strong></td><td>merge forcing fast-forward</td></tr>
<tr><td><strong>git mergeto</strong></td><td>inverted merging (being on target branch) without specifying fast-forward style</td></tr>
<tr><td><strong>git mergetonf</strong></td><td>inverted merging (being on target branch) without fast-forwarding</td></tr>
<tr><td><strong>git mergetoff</strong></td><td>inverted merging (being on target branch) forcing fast-forward</td></tr>
<tr><td><strong>git mtonf</strong></td><td>↪ mergetonf</td></tr>
<tr><td><strong>git mtoff</strong></td><td>↪ mergetoff</td></tr>
<tr><td><strong>git cleanorig</strong></td><td>remove .orig files created while merge conflicts</td></tr>
</table>

# pull
<table>
<tr><td><strong>git pl</strong></td><td>pull</td></tr>
<tr><td><strong>git pul</strong></td><td>pull</td></tr>
<tr><td><strong>git pur</strong></td><td>pull with rebase instead of merge</td></tr>
<tr><td><strong>git update</strong></td><td>make your repo up-to-date and show new commits added</td></tr>
<tr><td><strong>git up</strong></td><td>↪ update</td></tr>
</table>

# push
<table>
<tr><td><strong>git ps</strong></td><td>push</td></tr>
<tr><td><strong>git pus</strong></td><td>push</td></tr>
<tr><td><strong>git pf</strong></td><td>force push (attention: may create huge chaos)</td></tr>
</table>

# rebase
<table>
<tr><td><strong>git rbi</strong></td><td>rebase current branch (assume being forked from master)</td></tr>
<tr><td><strong>git rbih</strong></td><td>rebase n revisions from HEAD (default 3)</td></tr>
<tr><td><strong>git rba</strong></td><td>rebase automatically (find oldest commit to be fixupped or squashed)</td></tr>
<tr><td><strong>git fix</strong></td><td>fixup specific commit (default HEAD)</td></tr>
<tr><td><strong>git fix-rebase</strong></td><td>fixup specific commit and initiate rebase on that commit so that the fixup can quickly be applied</td></tr>
<tr><td><strong>git fr</strong></td><td>↪ fix-rebase</td></tr>
<tr><td><strong>git fix-instant</strong></td><td>fix a commit and instantly rebase to it (no questions asked)</td></tr>
<tr><td><strong>git fi</strong></td><td>↪ fix-instant</td></tr>
</table>

# reset
<table>
<tr><td><strong>git r</strong></td><td>reset</td></tr>
<tr><td><strong>git rh</strong></td><td>reset hard</td></tr>
<tr><td><strong>git reset-hard-origin</strong></td><td>reset hard (to origin)</td></tr>
<tr><td><strong>git reset-hard-tracking</strong></td><td>reset hard (to tracking branch)</td></tr>
<tr><td><strong>git rho</strong></td><td>↪ reset-hard-origin</td></tr>
<tr><td><strong>git rht</strong></td><td>↪ reset-hard-tracking</td></tr>
</table>

# review
<table>
<tr><td><strong>git diff-since-fork</strong></td><td>show diff since fork</td></tr>
<tr><td><strong>git word-diff-since-fork</strong></td><td>show word-based diff since fork</td></tr>
<tr><td><strong>git files-changed-since-fork</strong></td><td>show files changed since fork</td></tr>
<tr><td><strong>git remove-branch</strong></td><td>remove branch</td></tr>
<tr><td><strong>git rmb</strong></td><td>↪ remove-branch</td></tr>
<tr><td><strong>git remove-branch-with-tracking</strong></td><td>remove branch including tracked branch</td></tr>
<tr><td><strong>git rmbt</strong></td><td>↪ remove-branch-with-tracking</td></tr>
<tr><td><strong>git remove-tag</strong></td><td>remove tag</td></tr>
<tr><td><strong>git rmt</strong></td><td>↪ remove-tag</td></tr>
<tr><td><strong>git remove-tag-with-remote</strong></td><td>remove tag including remote tag of with name</td></tr>
<tr><td><strong>git rmtr</strong></td><td>↪ remove-tag-with-remote</td></tr>
</table>

# short
<table>
<tr><td><strong>git s</strong></td><td>status</td></tr>
<tr><td><strong>git l</strong></td><td>log</td></tr>
<tr><td><strong>git d</strong></td><td>diff</td></tr>
<tr><td><strong>git a</strong></td><td>add</td></tr>
<tr><td><strong>git c</strong></td><td>commit</td></tr>
<tr><td><strong>git b</strong></td><td>branch</td></tr>
<tr><td><strong>git m</strong></td><td>merge</td></tr>
<tr><td><strong>git f</strong></td><td>fetch</td></tr>
<tr><td><strong>git r</strong></td><td>reset</td></tr>
<tr><td><strong>git t</strong></td><td>tag</td></tr>
<tr><td><strong>git g</strong></td><td>grep</td></tr>
<tr><td><strong>git i</strong></td><td>init</td></tr>
<tr><td><strong>git p</strong></td><td>pull</td></tr>
<tr><td><strong>git ps</strong></td><td>push</td></tr>
<tr><td><strong>git sh</strong></td><td>show</td></tr>
<tr><td><strong>git cl</strong></td><td>clone</td></tr>
<tr><td><strong>git co</strong></td><td>checkout</td></tr>
<tr><td><strong>git rb</strong></td><td>rebase</td></tr>
<tr><td><strong>git st</strong></td><td>stash</td></tr>
<tr><td><strong>git bi</strong></td><td>bisect</td></tr>
<tr><td><strong>git ch</strong></td><td>cherry-pick</td></tr>
<tr><td><strong>git bl</strong></td><td>blame</td></tr>
<tr><td><strong>git ar</strong></td><td>archive</td></tr>
<tr><td><strong>git desc</strong></td><td>describe</td></tr>
</table>

# stash
<table>
<tr><td><strong>git sl</strong></td><td>list stashes</td></tr>
<tr><td><strong>git sa</strong></td><td>apply stash</td></tr>
<tr><td><strong>git ss</strong></td><td>save stash</td></tr>
<tr><td><strong>git sp</strong></td><td>pop stash</td></tr>
<tr><td><strong>git snapshot</strong></td><td>snapshot current state</td></tr>
<tr><td><strong>git sn</strong></td><td>↪ snapshot</td></tr>
</table>

# status
<table>
<tr><td><strong>git s</strong></td><td>short status</td></tr>
<tr><td><strong>git st</strong></td><td>more verbose status</td></tr>
<tr><td><strong>git overview</strong></td><td>overview, parameter: number of log entries [default 3]</td></tr>
<tr><td><strong>git o</strong></td><td>↪ overview</td></tr>
<tr><td><strong>git overview-diff</strong></td><td>overview including working dir diff, parameter: number of log entries [default 3]</td></tr>
<tr><td><strong>git od</strong></td><td>↪ overview-diff</td></tr>
</table>

# tracking
<table>
<tr><td><strong>git track</strong></td><td>checkout a branch from a remote (default origin) as a tracking branch</td></tr>
<tr><td><strong>git tr</strong></td><td>↪ track</td></tr>
<tr><td><strong>git publish</strong></td><td>publish a branch (default current) to a remote (default origin)</td></tr>
<tr><td><strong>git pub</strong></td><td>↪ publish</td></tr>
</table>

