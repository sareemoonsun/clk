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
          "id": "00799a11-18c3-4de0-907a-b2a65f6c7749",
          "type": "basic.output",
          "data": {
            "name": "seg",
            "virtual": false,
            "range": "[6:0]",
            "pins": [
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1712,
            "y": 384
          }
        },
        {
          "id": "5b391d0c-926a-492e-8008-af7bc4d2390e",
          "type": "basic.input",
          "data": {
            "name": "",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 496
          }
        },
        {
          "id": "f780e6a5-48af-4b8b-be61-2403373fb86a",
          "type": "basic.output",
          "data": {
            "name": "dig",
            "virtual": false,
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1384,
            "y": 568
          }
        },
        {
          "id": "3a8ef18b-fb78-4132-b382-691f944b49aa",
          "type": "b1dfea86b8e721be5f37412b0b7c533293c68b51",
          "position": {
            "x": 88,
            "y": 496
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "255d84fa-5d67-4c35-a4bf-b1e58cd6cfbe",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "Clk_i"
                }
              ],
              "out": [
                {
                  "name": "DOut",
                  "range": "[15:0]",
                  "size": 16
                }
              ]
            },
            "params": [],
            "code": "reg [7:0] rMainCount = 0;\r\nreg [3:0] rMainMode;\r\nreg [13:0] hCounter;\r\nreg [15:0] bCounter;\r\n\r\nalways @(posedge Clk_i) begin\r\n    if (rMainCount >= 29) begin\r\n        rMainCount <= 0;\r\n    end else begin\r\n        rMainCount <= rMainCount + 1;\r\n    end\r\n\r\n    if (rMainCount >= 15) begin\r\n        hCounter <= 14'd29 - rMainCount;\r\n        rMainMode <= 4'hc;\r\n    end \r\n    else if (rMainCount >= 10) begin\r\n        hCounter <= 14'd14 - rMainCount;\r\n        rMainMode <= 4'hb;\r\n    end \r\n    else begin\r\n        hCounter <= 14'd9 - rMainCount;\r\n        rMainMode <= 4'ha;\r\n    end\r\nend\r\n\r\ninteger i;\r\nalways @(hCounter) begin\r\n    bCounter = 16'd0;\r\n    \r\n    for (i = 13; i >= 0; i = i - 1) begin\r\n        if (bCounter[3:0] >= 5)   bCounter[3:0]   = bCounter[3:0] + 3;\r\n        if (bCounter[7:4] >= 5)   bCounter[7:4]   = bCounter[7:4] + 3;\r\n        if (bCounter[11:8] >= 5)  bCounter[11:8]  = bCounter[11:8] + 3;\r\n        if (bCounter[15:12] >= 5) bCounter[15:12] = bCounter[15:12] + 3;\r\n        \r\n        bCounter = bCounter << 1;\r\n        bCounter[0] = hCounter[i];\r\n    end\r\nend"
          },
          "position": {
            "x": 304,
            "y": 168
          },
          "size": {
            "width": 664,
            "height": 680
          }
        },
        {
          "id": "38c789b9-f276-416b-8249-608cce4ff655",
          "type": "7a07389332758e34bc830d6797821652ff8901d7",
          "position": {
            "x": 1384,
            "y": 480
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "80724e73-3eef-4c80-bbd6-db37f6dd03ec",
          "type": "db5066043efffb6842fbb85d0ca26036fb2f9479",
          "position": {
            "x": 1168,
            "y": 496
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "45330f72-14d6-4845-ac23-8572ceae3b07",
          "type": "cf063d0f800f5d3d651260d7483ca1bb7ea1e533",
          "position": {
            "x": 1568,
            "y": 480
          },
          "size": {
            "width": 96,
            "height": 64
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "3a8ef18b-fb78-4132-b382-691f944b49aa",
            "port": "ce8a4259-6ca2-46d2-aeb3-ff03e2f84e67"
          },
          "target": {
            "block": "255d84fa-5d67-4c35-a4bf-b1e58cd6cfbe",
            "port": "Clk_i"
          }
        },
        {
          "source": {
            "block": "255d84fa-5d67-4c35-a4bf-b1e58cd6cfbe",
            "port": "DOut"
          },
          "target": {
            "block": "80724e73-3eef-4c80-bbd6-db37f6dd03ec",
            "port": "0da5cdb3-920e-4b80-9265-fdbd88076de7"
          },
          "size": 16
        },
        {
          "source": {
            "block": "80724e73-3eef-4c80-bbd6-db37f6dd03ec",
            "port": "6e4d9ae1-1c9b-439f-95fd-993e2d5b1d04"
          },
          "target": {
            "block": "38c789b9-f276-416b-8249-608cce4ff655",
            "port": "b67648ae-94ac-42f7-9aff-8d9145b29901"
          },
          "size": 4
        },
        {
          "source": {
            "block": "3a8ef18b-fb78-4132-b382-691f944b49aa",
            "port": "96edc1ec-b976-4b73-8eef-ee3480636309"
          },
          "target": {
            "block": "80724e73-3eef-4c80-bbd6-db37f6dd03ec",
            "port": "e396849c-b648-413b-8ea0-3299703ed107"
          },
          "vertices": [
            {
              "x": 240,
              "y": 968
            },
            {
              "x": 1048,
              "y": 728
            }
          ]
        },
        {
          "source": {
            "block": "80724e73-3eef-4c80-bbd6-db37f6dd03ec",
            "port": "04d1b4bf-3623-4839-a635-d9f37dfaaf0c"
          },
          "target": {
            "block": "f780e6a5-48af-4b8b-be61-2403373fb86a",
            "port": "in"
          },
          "size": 4
        },
        {
          "source": {
            "block": "38c789b9-f276-416b-8249-608cce4ff655",
            "port": "f9d1abdd-9d43-4e1b-bfe8-c9a32e3ae5ab"
          },
          "target": {
            "block": "45330f72-14d6-4845-ac23-8572ceae3b07",
            "port": "aec4abb3-0e84-42a9-b3ad-6ad27d2c6846"
          },
          "size": 7
        },
        {
          "source": {
            "block": "45330f72-14d6-4845-ac23-8572ceae3b07",
            "port": "897baf3f-be87-4ecf-b3cc-61334437e1b0"
          },
          "target": {
            "block": "00799a11-18c3-4de0-907a-b2a65f6c7749",
            "port": "in"
          },
          "size": 7
        }
      ]
    }
  },
  "dependencies": {
    "b1dfea86b8e721be5f37412b0b7c533293c68b51": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "ce8a4259-6ca2-46d2-aeb3-ff03e2f84e67",
              "type": "basic.output",
              "data": {
                "name": "1hz"
              },
              "position": {
                "x": 720,
                "y": 160
              }
            },
            {
              "id": "8d7f4e6b-a211-4ef0-8f9a-cc8473a9b537",
              "type": "basic.input",
              "data": {
                "name": "clk_i",
                "clock": false
              },
              "position": {
                "x": -16,
                "y": 280
              }
            },
            {
              "id": "96edc1ec-b976-4b73-8eef-ee3480636309",
              "type": "basic.output",
              "data": {
                "name": "1000hz"
              },
              "position": {
                "x": 712,
                "y": 408
              }
            },
            {
              "id": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
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
                "code": "reg rQ2H = 1'b0;\r\nreg rQ2K = 1'b0;\r\nreg [27:0] CounterH;\r\nreg [27:0] CounterK;\r\nparameter fin    = 12_000_000; // Freq Input\r\nparameter foutH  = 1;          // Freq Output\r\nparameter foutK  = 1_000;      // Freq Output\r\nparameter ConstH = fin/(2*foutH);\r\nparameter ConstK = fin/(2*foutK);\r\n\r\nalways@(posedge clk_i)\r\nbegin\r\n    CounterH <= CounterH + 1;\r\n    if ( CounterH == ConstH)\r\n    begin\r\n        CounterH <= 0;\r\n        rQ2H <= ~rQ2H;\r\n    end\r\n\r\n    CounterK <= CounterK + 1;\r\n    if ( CounterK == ConstK)\r\n    begin\r\n        CounterK <= 0;\r\n        rQ2K <= ~rQ2K;\r\n    end\r\nend\r\n\r\nassign clk_1000Hz = rQ2K;\r\nassign clk_1Hz    = rQ2H;"
              },
              "position": {
                "x": 160,
                "y": 64
              },
              "size": {
                "width": 464,
                "height": 496
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "8d7f4e6b-a211-4ef0-8f9a-cc8473a9b537",
                "port": "out"
              },
              "target": {
                "block": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
                "port": "clk_i"
              }
            },
            {
              "source": {
                "block": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
                "port": "clk_1Hz"
              },
              "target": {
                "block": "ce8a4259-6ca2-46d2-aeb3-ff03e2f84e67",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "ab0c4406-ca85-475f-9cb4-3f3c757685b5",
                "port": "clk_1000Hz"
              },
              "target": {
                "block": "96edc1ec-b976-4b73-8eef-ee3480636309",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "7a07389332758e34bc830d6797821652ff8901d7": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "f9d1abdd-9d43-4e1b-bfe8-c9a32e3ae5ab",
              "type": "basic.output",
              "data": {
                "name": "di",
                "range": "[6:0]",
                "size": 7
              },
              "position": {
                "x": 464,
                "y": -144
              }
            },
            {
              "id": "b67648ae-94ac-42f7-9aff-8d9145b29901",
              "type": "basic.input",
              "data": {
                "name": "a",
                "range": "[3:0]",
                "clock": false,
                "size": 4
              },
              "position": {
                "x": -176,
                "y": -96
              }
            },
            {
              "id": "c7d5acb1-99ad-40f6-ab1c-0de09f821f2e",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "AI",
                      "range": "[3:0]",
                      "size": 4
                    }
                  ],
                  "out": [
                    {
                      "name": "DO",
                      "range": "[6:0]",
                      "size": 7
                    }
                  ]
                },
                "params": [],
                "code": "assign DO\r\n    = (AI == 4'b0000) ? 7'h7E :\r\n      (AI == 4'b0001) ? 7'h30 :\r\n      (AI == 4'b0010) ? 7'h6D :\r\n      (AI == 4'b0011) ? 7'h79 :\r\n      (AI == 4'b0100) ? 7'h33 :\r\n      (AI == 4'b0101) ? 7'h5B :\r\n      (AI == 4'b0110) ? 7'h5F :\r\n      (AI == 4'b0111) ? 7'h70 :\r\n      (AI == 4'b1000) ? 7'h7F :\r\n      (AI == 4'b1001) ? 7'h7B :\r\n      (AI == 4'b1010) ? 7'h77 :\r\n      (AI == 4'b1011) ? 7'h1F :\r\n      (AI == 4'b1100) ? 7'h4E :\r\n      (AI == 4'b1101) ? 7'h3D :\r\n      (AI == 4'b1110) ? 7'h4F :\r\n      (AI == 4'b1111) ? 7'h47 : 7'h00;"
              },
              "position": {
                "x": -24,
                "y": -176
              },
              "size": {
                "width": 408,
                "height": 312
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "c7d5acb1-99ad-40f6-ab1c-0de09f821f2e",
                "port": "DO"
              },
              "target": {
                "block": "f9d1abdd-9d43-4e1b-bfe8-c9a32e3ae5ab",
                "port": "in"
              },
              "size": 7
            },
            {
              "source": {
                "block": "b67648ae-94ac-42f7-9aff-8d9145b29901",
                "port": "out"
              },
              "target": {
                "block": "c7d5acb1-99ad-40f6-ab1c-0de09f821f2e",
                "port": "AI"
              },
              "size": 4
            }
          ]
        }
      }
    },
    "db5066043efffb6842fbb85d0ca26036fb2f9479": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "6e4d9ae1-1c9b-439f-95fd-993e2d5b1d04",
              "type": "basic.output",
              "data": {
                "name": "value",
                "range": "[3:0]",
                "size": 4
              },
              "position": {
                "x": 704,
                "y": 104
              }
            },
            {
              "id": "0da5cdb3-920e-4b80-9265-fdbd88076de7",
              "type": "basic.input",
              "data": {
                "name": "din",
                "range": "[15:0]",
                "clock": false,
                "size": 16
              },
              "position": {
                "x": -16,
                "y": 128
              }
            },
            {
              "id": "e396849c-b648-413b-8ea0-3299703ed107",
              "type": "basic.input",
              "data": {
                "name": "scan_clk",
                "clock": false
              },
              "position": {
                "x": 104,
                "y": 152
              }
            },
            {
              "id": "04d1b4bf-3623-4839-a635-d9f37dfaaf0c",
              "type": "basic.output",
              "data": {
                "name": "dig4",
                "range": "[3:0]",
                "size": 4
              },
              "position": {
                "x": 704,
                "y": 320
              }
            },
            {
              "id": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "Clk_i"
                    },
                    {
                      "name": "DataIn",
                      "range": "[15:0]",
                      "size": 16
                    }
                  ],
                  "out": [
                    {
                      "name": "Seg",
                      "range": "[3:0]",
                      "size": 4
                    },
                    {
                      "name": "Post",
                      "range": "[3:0]",
                      "size": 4
                    }
                  ]
                },
                "params": [],
                "code": "reg [3:0] rVSegment;\r\nreg [3:0] rPosition;\r\nreg [1:0] rDispCnt;\r\n\r\nalways@(posedge Clk_i) begin\r\n    rDispCnt <= rDispCnt+1;\r\n    if (rDispCnt==3) begin\r\n        rVSegment = DataIn[15:12];\r\n        rPosition = 4'b1000;\r\n    end\r\n    if (rDispCnt==2) begin\r\n        rVSegment = DataIn[11:8];\r\n        rPosition = 4'b0100;\r\n    end\r\n    if (rDispCnt==1) begin\r\n        rVSegment = DataIn[7:4];\r\n        rPosition = 4'b0010;\r\n    end\r\n    if (rDispCnt==0) begin\r\n        rVSegment = DataIn[3:0];\r\n        rPosition = 4'b0001;\r\n    end\r\nend\r\n\r\nassign Post = rPosition;\r\nassign Seg  = rVSegment;"
              },
              "position": {
                "x": 240,
                "y": 72
              },
              "size": {
                "width": 400,
                "height": 440
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "e396849c-b648-413b-8ea0-3299703ed107",
                "port": "out"
              },
              "target": {
                "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
                "port": "Clk_i"
              }
            },
            {
              "source": {
                "block": "0da5cdb3-920e-4b80-9265-fdbd88076de7",
                "port": "out"
              },
              "target": {
                "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
                "port": "DataIn"
              },
              "size": 16
            },
            {
              "source": {
                "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
                "port": "Seg"
              },
              "target": {
                "block": "6e4d9ae1-1c9b-439f-95fd-993e2d5b1d04",
                "port": "in"
              },
              "size": 4
            },
            {
              "source": {
                "block": "a31d20ba-a746-408c-8b77-45a4e8665ef5",
                "port": "Post"
              },
              "target": {
                "block": "04d1b4bf-3623-4839-a635-d9f37dfaaf0c",
                "port": "in"
              },
              "size": 4
            }
          ]
        }
      }
    },
    "cf063d0f800f5d3d651260d7483ca1bb7ea1e533": {
      "package": {
        "name": "not-x7-verilog",
        "version": "2.1",
        "description": "not-x7-verilog: 7-bits not gate. Verilog implementation",
        "author": "Jesús Arroyo, Juan González",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22317.651%22%20height=%22194.058%22%20version=%221%22%3E%3Cpath%20d=%22M69.246%204l161.86%2093.027-161.86%2093.031V4z%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linejoin=%22round%22/%3E%3Cellipse%20cx=%22253.352%22%20cy=%2296.736%22%20rx=%2221.393%22%20ry=%2221.893%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M4.057%2097.49h65.262m205.796%200h38.48%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%2281.112%22%20y=%22111.734%22%20transform=%22scale(.99532%201.0047)%22%20font-weight=%22400%22%20font-size=%2249.675%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#00f%22%3E%3Ctspan%20x=%2281.112%22%20y=%22111.734%22%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20font-weight=%22700%22%3ENot%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "897baf3f-be87-4ecf-b3cc-61334437e1b0",
              "type": "basic.output",
              "data": {
                "name": "",
                "range": "[6:0]",
                "size": 7
              },
              "position": {
                "x": 568,
                "y": 56
              }
            },
            {
              "id": "aec4abb3-0e84-42a9-b3ad-6ad27d2c6846",
              "type": "basic.input",
              "data": {
                "name": "",
                "range": "[6:0]",
                "clock": false,
                "size": 7
              },
              "position": {
                "x": 0,
                "y": 56
              }
            },
            {
              "id": "e3bb41e3-1944-4946-9675-c2dbe2e49fcf",
              "type": "basic.info",
              "data": {
                "info": "Input",
                "readonly": true
              },
              "position": {
                "x": 16,
                "y": 32
              },
              "size": {
                "width": 80,
                "height": 40
              }
            },
            {
              "id": "8408dd5f-945f-4a89-9790-7752813d4e91",
              "type": "basic.info",
              "data": {
                "info": "Output",
                "readonly": true
              },
              "position": {
                "x": 584,
                "y": 32
              },
              "size": {
                "width": 80,
                "height": 40
              }
            },
            {
              "id": "b16825d3-d6a8-4202-8db9-81d90113793c",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "i",
                      "range": "[6:0]",
                      "size": 7
                    }
                  ],
                  "out": [
                    {
                      "name": "o",
                      "range": "[6:0]",
                      "size": 7
                    }
                  ]
                },
                "params": [],
                "code": "//-- Not Gate\nassign o =  ~i;"
              },
              "position": {
                "x": 160,
                "y": 16
              },
              "size": {
                "width": 344,
                "height": 136
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "aec4abb3-0e84-42a9-b3ad-6ad27d2c6846",
                "port": "out"
              },
              "target": {
                "block": "b16825d3-d6a8-4202-8db9-81d90113793c",
                "port": "i"
              },
              "size": 7
            },
            {
              "source": {
                "block": "b16825d3-d6a8-4202-8db9-81d90113793c",
                "port": "o"
              },
              "target": {
                "block": "897baf3f-be87-4ecf-b3cc-61334437e1b0",
                "port": "in"
              },
              "size": 7
            }
          ]
        }
      }
    }
  }
}