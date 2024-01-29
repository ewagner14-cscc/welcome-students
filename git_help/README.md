# How to use git with lab homework

## Setup CSCC VM

There are a few pre-requisities for setting the CSCC VM. Lets get used to using the terminal. Open the terminal.

![find the terminal program](./static/cscc_term.png)

First we need to create an .ssh directory in home directory and give it the correct permissions. Run the command: ```mkdir ~/.ssh && chmod 700 ~/.ssh```

Next, we setup our git username and email global settings.

Run these commands in the CSCC VM, replacing with your name and CSCC email:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```


## Create a GitHub SSH key

There are a few different ways to use GitHub code. If you are a pro :sunglasses:, feel free to set up however you like. If you want something that just works, follow the instructions at this [GitHub documentation link for setting up an SSH Key in your CSCC VM](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux). The instructions at the link, also send you to this step, [generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

The basic steps are:

 1. Log into CSCC VM
    2. Log into github from the web browser in the CSCC VM
    3. Open a terminal in the CSCC VM
    4. Create a new ssh key in the terminal. [This link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
       1. ```ssh-keygen -t ed25519 -C "studentemail@students.cscc.edu"```
          1. accept all the defaults by clicking enter 3-4 times (save location, no password, etc)
       2. ```cat /home/CSCC/<student_user_name>/.ssh/id_ed25519.pub```
       3. Copy the cat command output, and paste into github. [this link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux)
    5. Make sure to add ssh key to your agent. [This link again](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
       1. ```eval "$(ssh-agent -s)"```
       2. ```ssh-add ~/.ssh/id_ed25519```

## Clone the git repo and create a working branch

We follow these steps to get a local working copy of the code for the labs.

1. Open the URL for the homework
2. Grab the git clone command in the upper right.
    1. Click the green Code button to get a dropdown
    2. Click the SSH tab (recommendation)
    3. Copy the git@github.com string
        1. ![example](./static/git_clone.png)
3. Go to your terminal in your workspace (ex: CSCC VM)
4. Navigate to your project directory (ex: ```cd labs/week3```)
5. Run the ```git clone``` command pasting the string you copied
    1. Now the repo should be down on your machine
    2. Use the command ```cd <git_repo>``` to enter the git repo
6. Create a working branch with the ```git checkout -b <new_branch_name>``` command
   1. The flag```-b``` is a shortcut to create and checkout a new branch.
7. Now you are ready to begin your work

## Edits are made to the working branch

Begin working on your solutions in the new branch. List your available branches with: ``` git branch -v```

You can switch back and forth between branches. Use the command ```git checkout <branchname>```

With work either complete or you need some feedback, now you want to check the working branch code back into GitHub for collaboration.

To get the changes

## Push the code up

 to ask for a pull request.
