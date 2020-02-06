### The BV assignment

The task is described [here](task/DevOpsInterviewTaskSecurity.pdf)

I got 5 requirements to cover in this assignment.

I have built the CICD script so it takes 2 arguments that are the **docker login** username and the version you want to commit.

The script assumes you are already logged in to the **public docker repo**.

If not it is aborted.

In order to use the script you need to clone it with the following command.

``` bash 
git clone https://github.com/r3ap3rpy/BVAssignment
```

Then you need to add executable permissions to the CICD.sh script.

``` bash
chmod +x CICD.sh
```

The script takes 2 arguments, one is your public docker account name, the second is the version you would like to commit of this application.

Unless both are specified the script aborts the execution.

If both are specified the script assumes the **docker login** is already available an you can push the images.


