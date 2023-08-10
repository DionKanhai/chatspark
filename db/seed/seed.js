const faker = require('faker');
const sequelize = require('../sequelize-instance');
const User = require('../models/user');


async function seedDatabase() {

  for (let i = 0; i < 10; i++) {
    await User.create({
      username: faker.internet.userName(),
      email: faker.internet.email(),
      password: faker.internet.password(),
    });
  }

  console.log('Seeding finished!')
}

seedDatabase();