{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_boss_sword",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":{"name":"parent_ship","path":"objects/parent_ship/parent_ship.yy",},"eventNum":0,"eventType":4,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":1,"eventType":2,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":2,"eventType":2,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":3,"eventType":2,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":4,"eventType":2,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":2,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_enemy","path":"objects/parent_enemy/parent_enemy.yy",},"propertyId":{"name":"hp","path":"objects/parent_enemy/parent_enemy.yy",},"value":"5000",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_enemy","path":"objects/parent_enemy/parent_enemy.yy",},"propertyId":{"name":"dmg","path":"objects/parent_enemy/parent_enemy.yy",},"value":"10",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"name","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"value":"\"Red Blade\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"atk_cd","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"value":"seconds(3)",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"skill_cd","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"value":"seconds(20)",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"ult_cd","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"value":"seconds(90)",},
  ],
  "parent": {
    "name": "Enemys",
    "path": "folders/Objects/Game/Enemys.yy",
  },
  "parentObjectId": {
    "name": "parent_elite_enemy",
    "path": "objects/parent_elite_enemy/parent_elite_enemy.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [],
  "solid": false,
  "spriteId": {
    "name": "spr_boss_sword",
    "path": "sprites/spr_boss_sword/spr_boss_sword.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}