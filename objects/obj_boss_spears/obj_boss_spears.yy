{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_boss_spears",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":2,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_enemy","path":"objects/parent_enemy/parent_enemy.yy",},"propertyId":{"name":"hp","path":"objects/parent_enemy/parent_enemy.yy",},"value":"7500",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_enemy","path":"objects/parent_enemy/parent_enemy.yy",},"propertyId":{"name":"dmg","path":"objects/parent_enemy/parent_enemy.yy",},"value":"20",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"atk_cd","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"value":"seconds(1)",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"skill_cd","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"value":"seconds(10)",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"name","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"value":"\"DECIMATION\"",},
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
    "name": "spr_boss_spears",
    "path": "sprites/spr_boss_spears/spr_boss_spears.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}