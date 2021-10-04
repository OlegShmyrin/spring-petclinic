pipeline {

    agent any

    environment{
        JAVA_TOOL_OPTION = "-Duser.home=/home/oleg/"
    }

    tools {
        terraform 'terraform-aws'
    }

    

    stages{
        stage("Test"){

            agent { 
                dockerfile {
                    label "docker"
                    args "-v /tmp/maven:/home/oleg/jenkins/.m2 -e MAVEN_CONFIG=/home/oleg/jenkins/.m2"   
                    }
                }

            steps{
               sh "mvn -v"                             
            }
        }
        
        /*
        stage ("Build"){
            agent {
                label "ansible"
            }
                      
            steps{
               sh "terraform init"
               sh "terraform apply -auto-approve"
               sh "terraform output"
               sh "cat inventory"
               sh "chmod -x inventory"
               sh "sudo mvn package -Dmaven.test.skip"
            }

          
        }

        stage ("Deploy"){
            agent {
                label "ansible"
            }
                      
            steps{
               sh "ansible-playbook playbook.yml -i inventory"
            }

          
        }

        */

    }
    /*
    post {
        always {
            cleanWs()
        }
    }
    */
}
