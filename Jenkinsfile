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
        stage("Build"){
            steps{
                sh "mvn -version"
                sh "pwd"
                sh "whoami"
                sh "ip a"
                sh "ll /home/oleg/jenkins"
                sh "/home/oleg/jenkins/workspace/PetClinic-pipe-line"

            }
        }
    }

    /*post {
        always {
            cleanWs()
        }
    }*/
}
