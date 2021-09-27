pipeline {

    agent any

    environment{
        JAVA_TOOL_OPTION = "-Duser.home=/home/jenkins"
    }

    tools {
        terraform 'terraform-aws'
    }

    

    stages{
       /* stage("Test"){

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
            */
        stage ("Terraform Apply"){
            agent {
                label "ansible"
            }

            
            
            steps{
               sh "terraform init"
               sh "terraform apply -auto-approve -state=./output.tfstate"
               //sh "terraform apply -destroy -auto-approve"
               sh "terraform output public_AppServer_ip > host.txt"

            }

            resource "local_file" "public_ip" {
                content  = public_AppServer_ip
                filename = "public_ip.pem"
            }

        }

    }

    /*post {
        always {
            cleanWs()
        }
    }*/
}
