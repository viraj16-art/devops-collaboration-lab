const request = require('supertest');
const { app, server } = require('../src/index');

describe('DevOps Lab Application', () => {
  afterAll((done) => {
    server.close(done);
  });

  describe('GET /', () => {
    it('should return welcome message', async () => {
      const response = await request(app).get('/');
      expect(response.statusCode).toBe(200);
      expect(response.body).toHaveProperty('message');
      expect(response.body.message).toBe('Welcome to DevOps Collaboration Lab!');
      expect(response.body).toHaveProperty('status', 'healthy');
    });
  });

  describe('GET /health', () => {
    it('should return health status', async () => {
      const response = await request(app).get('/health');
      expect(response.statusCode).toBe(200);
      expect(response.body).toHaveProperty('status', 'UP');
      expect(response.body).toHaveProperty('timestamp');
    });
  });

  describe('GET /api/info', () => {
    it('should return application info', async () => {
      const response = await request(app).get('/api/info');
      expect(response.statusCode).toBe(200);
      expect(response.body).toHaveProperty('application');
      expect(response.body).toHaveProperty('environment');
      expect(response.body).toHaveProperty('nodeVersion');
    });
  });
});
