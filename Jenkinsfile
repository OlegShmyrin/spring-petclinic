pipeline {

    agent any

    environment{
        JAVA_TOOL_OPTION = "-Duser.home=/home/jenkins"
    }

    tools {
        terraform 'terraform-aws'
    }

    

    stages{
        stage("Test"){

            agent { 
                dockerfile {
                    label "docker"
                    args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2"   
                    }
                }

            steps{
                // sh "echo StrictHostKeyChecking=no >> ~/.ssh/config"
                sh "ssh -V"
                // sh "mvn test"
                
                
            }
        }

        stage ("Terraform Init"){
            agent {
                label "terraform"
            }
            
            steps{
               sh 'terraform init'

            }
        }

    }

    /*post {
        always {
            cleanWs()
        }
    }*/
}
