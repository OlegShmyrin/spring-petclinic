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
                sh "java -jar target/*.jar"

            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
