pipeline {

    environment{
        JAVA_TOOL_OPTION = "-Duser.home=/var/maven/"
    }
    agent { 
        docker {
            image "maven:3.6.3-openjdk-17-slim"
            label "docker"
            args "-v /tmp/maven:/home/maven/.m2 -e MAVEN_CONFIG=/home/maven/.m2"   
        }
    }

    stages{
        stage("Test"){
            steps{
                //sh "echo StrictHostKeyChecking=no >> ~/.ssh/config"
                sh "mvn clean install"
                
                
            }
        }
    }

    /*post {
        always {
            cleanWs()
        }
    }*/
}
