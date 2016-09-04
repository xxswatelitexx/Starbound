Experiment 1: Particle Drip
Here I really just want to see how particles work.
There are some important points

"particleEmitter" : {
    "emissionRate" : 0.3, -- Number of particles per second 1 = 1 per second, 0.3 = 1 particle every 3 seconds.
    "emissionVariance" : 0.3, -- Variation of the rate. 
    "pixelOrigin" : [0, 0], -- origin of the pixel emitter

    "particle" : {
      "type" : "ember", -- particle type dictated in particle oflder
      "size" : 1.0,
      "color" : [255, 226, 67, 255], -- color overlay of particle
      "light" : [191, 181, 120], -- light emitted from particle
      "fade" : 0.9,
      "initialVelocity" : [0.0, 0.0], -- initial speed and direction
      "finalVelocity" : [0.0, -50.0], -- end speed and direction
      "approach" : [0, 20], -- rate of change from initial to final [ positive to maintain same direction, negative to go opposite direction ] 
      "timeToLive" : 2,
      "layer" : "front", -- layer in game particle generates. front \ middle ( player layer )
      "fullbright" : true -- fullbright true = not affected by sorrunding lighting
    },

    "particleVariance" : {
      "initialVelocity" : [5.0, 10.0], -- variation of above values
			"finalVelocity" : [0, 0]
    }
  }