
pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                  image 'docker:1.12.6'
                  args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
              sh '''
                docker build -t ${DOCKER_REGISTRY_URL}/${DOCKER_PROJECT_NAMESPACE}/${IMAGE_NAME}:${RELEASE_TAG} --build-arg APP_NAME=${IMAGE_NAME}  -f app/Dockerfile app/.
              '''
            withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "${JENKINS_DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWD']])
            {
              sh '''
              echo $DOCKER_PASSWD | docker login --username ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY_URL}
              docker push ${DOCKER_REGISTRY_URL}/${DOCKER_PROJECT_NAMESPACE}/${IMAGE_NAME}:${RELEASE_TAG}
              docker logout
              '''
            }
          }
        }
        stage('Helm') {
            agent {
                docker { image 'alpine/helm:2.14.0' }
            }
            steps {
                sh "helm upgrade --install ${args.name} ${args.chart_dir} --set imageTag=${args.version_tag},replicas=${args.replicas},cpu=${args.cpu},memory=${args.memory},ingress.hostname=${args.hostname} --namespace=${namespace}"
            }
        }
    }
}
