const { DataTypes } = require('sequelize');
const sequelize = require('./sequelize-instance');

const User = sequelize.define('User', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    allowNull: false,
  },
  username: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  password: { 
  type: DataTypes.STRING(100),
  allowNull: false,
  },
  email: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
});

module.exports = User;