***
Quizz of Git
***

    - https://kahoot.it/challenge/feaec984-7ba5-4f67-8b46-e25c5106c18f_1697607602130?&uid=c2Vi
    - https://www.w3schools.com/git/exercise.asp?filename=exercise_amend1 (all exercise did)
    - https://www.w3schools.com/quiztest/quiztest.asp?qtest=GIT

***
Commit without change file
***

    - git commit -m "<MESSAGE_CUSTOM>" --allow-empty
    - git push

***
Run a gitlab-runner container
***
    - WARNING : Don't change name of volumes 

    - docker run -d --name my-gitlab-runner --restart always \
        -v gitlab-runner:/etc/gitlab-runner \
        -v docker.sock:/var/run/docker.sock \
        gitlab/gitlab-runner:latest