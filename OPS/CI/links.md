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

***
Test CI in local
***

    - docker run -it -v <PATH_HOST>:/code -w /code <IMAGE_NAME> bash
        - example : 
            - docker run -it -v $PWD:/code -w /code seb7318/seb:v3 bash
***
Add variable in project Gitlab
***

    - Settings > CI/CD > Variables > Add variable

***
Execute a job with schedule
***

    - Add a new schedule in gitlab with a variable and value
    - Add rule in jobs for choose when he will be execute
