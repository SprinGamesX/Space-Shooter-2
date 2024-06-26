{
  "$GMObject":"",
  "%Name":"obj_boss_red_diamond",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":{"name":"parent_ship","path":"objects/parent_ship/parent_ship.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":{"name":"parent_deployable","path":"objects/parent_deployable/parent_deployable.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_boss_red_diamond",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"parent_enemy","path":"objects/parent_enemy/parent_enemy.yy",},"propertyId":{"name":"hp","path":"objects/parent_enemy/parent_enemy.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"3000",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"parent_enemy","path":"objects/parent_enemy/parent_enemy.yy",},"propertyId":{"name":"dmg","path":"objects/parent_enemy/parent_enemy.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"10",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"atk_cd","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"seconds(1)",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"skill_cd","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"seconds(4)",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"parent_elite_enemy","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"propertyId":{"name":"name","path":"objects/parent_elite_enemy/parent_elite_enemy.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"red diamond",},
  ],
  "parent":{
    "name":"Enemys",
    "path":"folders/Objects/Game/Enemys.yy",
  },
  "parentObjectId":{
    "name":"parent_elite_enemy",
    "path":"objects/parent_elite_enemy/parent_elite_enemy.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_wave5boss",
    "path":"sprites/spr_wave5boss/spr_wave5boss.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}