pipeline {

    environment{
        JAVA_TOOL_OPTION = "-Duser.home=/home/oleg/"
    }
    agent { 
        docker {
            image "maven:latest"
            label "docker"
            args "-v /tmp/maven:/home/oleg/.m2 -e MAVEN_CONFIG=/home/oleg/.m2"   
        }
    }

    stages{
        stage("Build"){
            steps{
                sh "mvn -version"
                sh "./mvnw package"  
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
