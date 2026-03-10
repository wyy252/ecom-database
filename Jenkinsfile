@Library('ecom-shared-lib') _

ciPipeline(
    serviceName: 'ecom-database',
    imageName: '3020244252/ecom-database',
    dockerCredentialsId: 'dockerhub-creds',
    buildCommand: './scripts/validate.sh',
    testCommand: './scripts/test.sh',
    devDeployCommand: 'docker rm -f ecom-database-dev || true && docker run -d --name ecom-database-dev -e POSTGRES_DB=ecommerce -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 35432:5432 $IMAGE_NAME:$BUILD_TAG_NAME',
    stagingDeployCommand: 'docker rm -f ecom-database-staging || true && docker run -d --name ecom-database-staging -e POSTGRES_DB=ecommerce -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 36432:5432 $IMAGE_NAME:$BUILD_TAG_NAME',
    prodDeployCommand: 'docker rm -f ecom-database-prod || true && docker run -d --name ecom-database-prod -e POSTGRES_DB=ecommerce -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 37432:5432 $IMAGE_NAME:$BUILD_TAG_NAME'
)