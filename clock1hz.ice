{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "iCEBreaker",
    "graph": {
      "blocks": [
        {
          "id": "3d9be5f3-a84a-4872-9bec-e6871a736ba4",
          "type": "basic.output",
          "data": {
            "name": "1Hz",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "LEDR",
                "value": "11"
              }
            ]
          },
          "position": {
            "x": 648,
            "y": 136
          }
        },
        {
          "id": "13d64cc7-e402-4f9b-8023-f29cbeb2848f",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "35"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -96,
            "y": 256
          }
        },
        {
          "id": "1777eddd-3ee1-4b12-9d4d-3e4725499a12",
          "type": "basic.output",
          "data": {
            "name": "1000Hz",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "LEDG",
                "value": "37"
              }
            ]
          },
          "position": {
            "x": 648,
            "y": 384
          }
        },
        {
          "id": "a3c2c997-e433-41ec-bce5-2cd87d777610",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk_i"
                }
              ],
              "out": [
                {
                  "name": "clk_1Hz"
                },
                {
                  "name": "clk_1000Hz"
                }
              ]
            },
            "params": [],
            "code": "reg rQ2H = 1'b0;\nreg rQ2k = 1'b0;\nreg [27:0] CounterH;\nreg [27:0] CounterK;\nparameter fin = 12_000_000;\nparameter foutH = 1;\nparameter foutK = 1_000;\nparameter COnstH = fin/(2*foutH);\nparameter ConstK = fin/(2*foutK);\n\nalways @(posedge clk_i)\nbegin\n    CounterH <= CounterH + 1;\n    if (CounterH == CoustH)\n        begin\n            CounterH <= 0;\n            rQ2H <== ~rQ2H;\n        end\n    \n    CounterK <= CounterK + 1;\n    if (CounterK == CoustK)\n        begin\n            CounterK <= 0;\n            rQ2K <= ~rQ2k;\n        end\nend\n\nassign clk_1kHz = rQ2k;\nassign clk_1Hz = rQ2H;"
          },
          "position": {
            "x": 80,
            "y": 40
          },
          "size": {
            "width": 456,
            "height": 496
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "13d64cc7-e402-4f9b-8023-f29cbeb2848f",
            "port": "out"
          },
          "target": {
            "block": "a3c2c997-e433-41ec-bce5-2cd87d777610",
            "port": "clk_i"
          }
        },
        {
          "source": {
            "block": "a3c2c997-e433-41ec-bce5-2cd87d777610",
            "port": "clk_1Hz"
          },
          "target": {
            "block": "3d9be5f3-a84a-4872-9bec-e6871a736ba4",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "a3c2c997-e433-41ec-bce5-2cd87d777610",
            "port": "clk_1000Hz"
          },
          "target": {
            "block": "1777eddd-3ee1-4b12-9d4d-3e4725499a12",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {}
}