node {
  stage 'git'
  git 'https://github.com/AbdullahElsheikh2019/CapstoneProject.git'
 
  stage 'Docker build'
  docker.build('demo')
 
  stage 'Docker push'
      docker.withRegistry('372839978247.dkr.ecr.eu-west-1.amazonaws.com/udacity', 'ecr:eu-west-1:UserC3') {
         docker.image('demo').push('latest')
  }
} 