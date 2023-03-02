# welcome-students

use this git repo to practice git commands and let us know what you are most excited about learning.

*pre-req - you already have a github username for class*

## Clone the repo and create a branch

First we are going to clone this repo, and create branch we can push up to GitHub at the end of class.

1) log into your CSCC Linux 2 virtual machine (VM) via https://mypc.cscc.edu
2) open a terminal in the VM
3) In the terminal, run the command `git clone git@github.com:ewagner14-cscc/welcome-students.git`
4) Navigate into the git repo with `cd welcome-students`
5) create a new branch with `git branch -b <username>` where *`<username>`* is your github user account you created or are using for class.

## Edit the markdown file

  Markdown files are special fiels that can produce HTML from their formatting. Very useful in creating documentation in software repositories. We are going to edit the reasons.md file with our reasons for taking this class, save the changes, and push up our branch to github.

  [markdown reference cheatsheet](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/quickstart-for-writing-on-github)

1) In your VM, use either vim, nano, emacs, or the text Editor to edit the reasons.md file.
2) Add what you hope to learn from the class. *ex: "I watn to learn how to use software containers."
3) If you add a picture, add it to the static/ folder in this repo link to one on the web.
4) save your file

## push changes up to GitHub

In the terminal run the following commands

  ```bash
  git add . # to add all of your changes to the branch
  git commit -m "my commit" # to commit your changes
  git push -u origin <username> # to push your branch to github
  ```
