pipeline {
    agent "any"
    stages {
        stage {
            steps ('checkout code') {
                git credentialsId: 'gitHub', url: 'https://github.com/potturi319/devops_challenge.git'
            }
        }
        stage {
            steps ('provising infrastructure') {
                # terraform intilization
                terraform init
            }
        }   
        stage {
            steps ('checking terraform planing & applying'){
                terraform plan
                terraform apply -auto-approve
            }
        }
    }
}