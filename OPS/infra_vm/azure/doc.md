***
Add a student account
***

    - https://azureforeducation.microsoft.com/fr-fr/Institutions
    - Activate option for free credits
    - Click on Subcribtion for find cloudshell in Resource providers 
    - Registered Microsoft.CloudShell provider
    - In the azure console mount a storage
    - Generate SSH Key

***
Execute ansible playbook script in azure console
***
    
    - Need to execute the command bellow

        - because version >=1.14 return an error
        - ansible-galaxy collection install azure.azcollection:1.13.0 
        
        - install requirements of azure for python
        - pip install -r </path-to-azcollection>/requirements-azure.txt
            - example : 
                - pip install -r /home/sebastien_jacquelin/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt
        - pip3 install azure-cli 

        ERROR 

***

***

