pipeline {
    agent {
        label 'windows'
    }

    stages {
        stage('SonarQube Analysis') {
            steps {
                script {
                    scannerHome = tool 'SonarQube'
                }
                
                withSonarQubeEnv('Azure SonarQube') {
                    bat 'sonar-scanner.bat -Dsonar.projectKey=ad-domain-services -Dsonar.sources=. -Dsonar.host.url=***REMOVED*** -Dsonar.login=***REMOVED***'
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building...'
            }
        }

        stage ('Test') {
            steps {
                echo 'Testing'
            }
        }

        stage ('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}
