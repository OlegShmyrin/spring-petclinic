pipeline {

    environment{
        JAVA_TOOL_OPTION = "-Duser.home=/home/jenkins"
    }

    tools {
        terraform 'terraform-aws'
    }

    agent { 
        dockerfile {
            label "docker"
            args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2"   
        }
    }

    stages{
        stage("Test"){
            steps{
                // sh "echo StrictHostKeyChecking=no >> ~/.ssh/config"
                sh "ssh -V"
                // sh "mvn test"
                
                
            }
        }

        stage ("Terraform Init"){
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
