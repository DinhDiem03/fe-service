FROM node:16.10.0

WORKDIR /app/FE

# Copy package.json and package-lock.json first to leverage Docker cache
COPY ./package.json .
COPY ./package-lock.json .

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY ./ .

# Build the React application
RUN npm run build

# Expose port 3010
EXPOSE 3010

# Serve the built application using serve
CMD ["npx", "serve", "-s", "build", "-l", "3010"]
