pipeline {
    agent { docker { image 'curlimages/curl:7.75.0'} }
    stages {
        stage('build') {
            steps {
                sh '''
                    echo "Multiline steps work too"
                    whoami
                '''
            }
        }
        stage('deploy') {
            steps {
                sh '''
                    pwd
                    ls -a
                '''
                sh 'sh /var/jenkins_home/workspace/node-pipeline_jenkins_tests/deploy_test.sh'
            }
        }
    }
    post {
        success {
            echo 'Everything worked as expected :)'
        }
        failure {
            echo 'Deploy could not finish.'
        }
    }
}
