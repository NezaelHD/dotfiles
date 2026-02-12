############################################################################
#                                                                          #
#               -------- Useful Git Aliases --------                       #
#                                                                          #
#     gs              : git status                                         #
#     gst             : git status (short + branch info)                   #
#     gl              : git log                                            #
#     gitlg           : pretty git log graph (branches + author + time)    #
#     ga              : git add                                            #
#     gaa             : git add all changes (tracked + untracked)          #
#     gal             : git add current directory                          #
#     gall            : git add current directory                          #
#     gc <msg>        : git commit with message                            #
#     gca             : git commit all tracked changes                     #
#     gco             : git checkout                                       #
#     gcot            : git checkout                                       #
#     gchekout        : git checkout (typo alias)                          #
#     gchckout        : git checkout (typo alias)                          #
#     gckout          : git checkout (typo alias)                          #
#     gcb <branch>    : git checkout -b <branch>                           #
#     gb              : git branch                                         #
#     gpo <branch>    : git push origin <branch>                           #
#     go <branch>     : git push -u origin <branch>                        #
#     gpl <branch>    : git pull origin <branch>                           #
#     gd              : git diff                                           #
#     gsh             : git stash                                          #
#     gw              : git whatchanged                                    #
#     gundo           : undo last commit (keep changes staged)             #
#     gclean          : hard reset + remove untracked files                #
#     nah             : discard ALL local changes                          #
#                                                                          #
############################################################################

alias gs="git status"
alias gst="git status -sb"
alias gl="git log"
alias ga="git add"
alias gaa="git add -A"
alias gal="git add ."
alias gall="git add ."
alias gca="git commit -a"
alias gc="git commit -m"
alias gcot="git checkout"
alias gchekout="git checkout"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gpo="git push origin"
alias gpl="git pull origin"
alias gd="git diff"
alias gclean="git reset --hard && git clean -df"
alias gundo="git reset --soft HEAD~1"
alias gchckout="git checkout"
alias gckout="git checkout"
alias go="git push -u origin"
alias gsh='git stash'
alias gw='git whatchanged'
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias nah="git clean -df && git checkout -- ."


alias permissions="sudo chown $(whoami):$(whoami) -R . && sudo chmod g+rw -R ."