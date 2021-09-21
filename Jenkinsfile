pipeline {

    environment{
        JAVA_TOOL_OPTION = "-Duser.home=/home/oleg/"
    }
    agent { 
        docker {
            image "maven:3.6.3-openjdk-17-slim"
            label "docker"
            args "-v /tmp/maven:/home/oleg/.m2 -e MAVEN_CONFIG=/home/oleg/.m2"   
        }
    }

    stages{
        stage("Test"){
            steps{
                sh "pwd"
                sh "whoami"
                sh "echo StrictHostKeyChecking=no >> ~/.ssh/config"
                sh "mvn test"
                
                
            }
        }
    }

    /*post {
        always {
            cleanWs()
        }
    }*/
}
