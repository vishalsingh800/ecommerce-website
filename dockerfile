# Use official image as base
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app code
COPY . .

# Build (if it's a React/Angular app)
# RUN npm run build

# Start app
CMD [ "npm", "start" ]
