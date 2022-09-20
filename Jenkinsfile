node {
    
    // environment{
        
    //  DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
        
    // }
    
    stage('Git checkout') {
        git branch: 'main', url: 'https://github.com/abdulrahman911/docker-webapp-ci-cd.git'
    }
    
    stage('Docker Build image'){
        sh "docker image build -t $JOB_NAME:v1.$BUILD_ID ."
        sh "docker image tag $JOB_NAME:v1.$BUILD_ID rahman777/$JOB_NAME:v1.$BUILD_ID"
        sh "docker image tag $JOB_NAME:v1.$BUILD_ID rahman777/$JOB_NAME:v1.latest"
    }
    
    stage('Push Docker images'){
     
    //   withCredentials([string(credentialsId: 'DockerPWD', variable: 'DockerPasswordRahman')]) {
    // some block
    //   sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
    //   sh "docker login -u rahman777 -p ${DockerPasswordRahman}"
    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
      
      docker.withRegistry('', 'dockerHub') {
      sh "docker login -u ${USERNAME} -p ${PASSWORD}"    
    //   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
      sh "docker image push rahman777/$JOB_NAME:v1.$BUILD_ID"
      sh "docker image push rahman777/$JOB_NAME:v1.latest"
      
      sh "docker image rm $JOB_NAME:v1.$BUILD_ID rahman777/$JOB_NAME:v1.$BUILD_ID rahman777/$JOB_NAME:v1.latest"
    }
    }
 }
    stage('Docker Container Deployment'){
        
        def docker_run = 'docker run -itd --name my-webcontainer -p 9000:80 rahman777/docker-webapp-ci-cd-abc:v1.latest'
        def docker_rm_container = 'docker rm -f my-webcontainer'
        def docker_rmi = 'docker image rm rahman777/docker-webapp-ci-cd-abc:v1.latest'
        
        sshagent(['ssh-docker-webapp-server']) {
        sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.21.154 ${docker_rm_container}"
        sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.21.154 ${docker_rmi}"
        
        sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.21.154 ${docker_run}"
    }
    }
}
