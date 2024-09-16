import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    Texture {
        id: textures_LCDs_0_baseColor_png_texture
        objectName: "textures/LCDs.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/LCDs.0_baseColor.png"
    }
    Texture {
        id: textures_Putih_0_baseColor_png_texture
        objectName: "textures/Putih.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Putih.0_baseColor.png"
    }
    Texture {
        id: textures_hub_rb_0_baseColor_png_texture
        objectName: "textures/hub_rb.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/hub_rb.0_baseColor.png"
    }
    Texture {
        id: textures_movsteer_1_0_1_baseColor_png_texture
        objectName: "textures/movsteer_1.0.1_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/movsteer_1.0.1_baseColor.png"
    }
    Texture {
        id: textures_pantulans_0_baseColor_png_texture
        objectName: "textures/pantulans.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/pantulans.0_baseColor.png"
    }
    Texture {
        id: textures_primary_001_baseColor_png_texture
        objectName: "textures/primary.001_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/primary.001_baseColor.png"
    }
    Texture {
        id: textures_movsteer_1_0_0_baseColor_png_texture
        objectName: "textures/movsteer_1.0.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/movsteer_1.0.0_baseColor.png"
    }
    Texture {
        id: textures_glass_0_baseColor_png_texture
        objectName: "textures/glass.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/glass.0_baseColor.png"
    }
    Texture {
        id: textures_hub_rf_1_baseColor_png_texture
        objectName: "textures/hub_rf.1_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/hub_rf.1_baseColor.png"
    }
    Texture {
        id: textures_texture_Buttons_0_baseColor_png_texture
        objectName: "textures/texture_Buttons.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/texture_Buttons.0_baseColor.png"
    }
    Texture {
        id: textures_right_rear_light_baseColor_png_texture
        objectName: "textures/right_rear_light_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/right_rear_light_baseColor.png"
    }
    Texture {
        id: textures_tembus_red_0_baseColor_png_texture
        objectName: "textures/tembus_red.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tembus_red.0_baseColor.png"
    }
    Texture {
        id: textures_belt_0_baseColor_png_texture
        objectName: "textures/belt.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/belt.0_baseColor.png"
    }
    Texture {
        id: textures_dvorright_0_baseColor_png_texture
        objectName: "textures/dvorright.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/dvorright.0_baseColor.png"
    }
    Texture {
        id: textures_back_chrome_light_0_baseColor_png_texture
        objectName: "textures/back_chrome_light.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/back_chrome_light.0_baseColor.png"
    }
    Texture {
        id: textures_glass_1_baseColor_png_texture
        objectName: "textures/glass.1_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/glass.1_baseColor.png"
    }
    Texture {
        id: textures_primary_002_baseColor_png_texture
        objectName: "textures/primary.002_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/primary.002_baseColor.png"
    }
    Texture {
        id: textures_light_pantulan_0_baseColor_png_texture
        objectName: "textures/light_pantulan.0_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/light_pantulan.0_baseColor.png"
    }
    Texture {
        id: textures_wheels_2_baseColor_png_texture
        objectName: "textures/wheels.2_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wheels.2_baseColor.png"
    }
    Texture {
        id: textures_wheels_3_baseColor_png_texture
        objectName: "textures/wheels.3_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wheels.3_baseColor.png"
    }
    Texture {
        id: textures_wheels_4_baseColor_png_texture
        objectName: "textures/wheels.4_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wheels.4_baseColor.png"
    }
    Texture {
        id: textures_wheels_6_baseColor_png_texture
        objectName: "textures/wheels.6_baseColor.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wheels.6_baseColor.png"
    }
    PrincipledMaterial {
        id: dvorright_0_material
        objectName: "dvorright.0"
        baseColorMap: textures_dvorright_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: movsteer_1_0_1_material
        objectName: "movsteer_1.0.1"
        baseColorMap: textures_movsteer_1_0_1_baseColor_png_texture
        metalness: 0.7191705107688904
        roughness: 0.4206734895706177
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: movsteer_1_0_0_material
        objectName: "movsteer_1.0.0"
        baseColorMap: textures_movsteer_1_0_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: chassis_0_material
        objectName: "chassis.0"
        baseColor: "#ffcccccc"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: primary_material
        objectName: "primary"
        baseColor: "#ffd1d1d1"
        roughness: 0.280829519033432
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: primary_001_material
        objectName: "primary.001"
        baseColorMap: textures_primary_001_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: back_chrome_light_0_material
        objectName: "back_chrome_light.0"
        baseColorMap: textures_back_chrome_light_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: pantulans_0_material
        objectName: "pantulans.0"
        baseColorMap: textures_pantulans_0_baseColor_png_texture
        roughness: 1
        emissiveMap: textures_pantulans_0_baseColor_png_texture
        emissiveFactor: Qt.vector3d(1, 1, 1)
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: right_rear_light_material
        objectName: "right_rear_light"
        baseColorMap: textures_right_rear_light_baseColor_png_texture
        roughness: 1
        emissiveMap: textures_right_rear_light_baseColor_png_texture
        emissiveFactor: Qt.vector3d(1, 1, 1)
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: breaklight_l_material
        objectName: "breaklight_l"
        baseColorMap: textures_right_rear_light_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: aluminium_light_0_material
        objectName: "aluminium_light.0"
        baseColorMap: textures_movsteer_1_0_1_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: tembus_red_0_material
        objectName: "tembus_red.0"
        baseColor: "#d0ffffff"
        baseColorMap: textures_tembus_red_0_baseColor_png_texture
        roughness: 0.7661632895469666
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Blend
    }
    PrincipledMaterial {
        id: belt_0_material
        objectName: "belt.0"
        baseColorMap: textures_belt_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: satin_red_0_material
        objectName: "satin_red.0"
        baseColorMap: textures_pantulans_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: putih_0_material
        objectName: "Putih.0"
        baseColorMap: textures_Putih_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: carpet_Light_0_material
        objectName: "Carpet_Light.0"
        baseColor: "#ff242424"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: texture_Buttons_0_material
        objectName: "texture_Buttons.0"
        baseColorMap: textures_texture_Buttons_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: lcds_0_material
        objectName: "LCDs.0"
        baseColorMap: textures_LCDs_0_baseColor_png_texture
        roughness: 1
        emissiveMap: textures_LCDs_0_baseColor_png_texture
        emissiveFactor: Qt.vector3d(1, 1, 1)
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: mirror_inside_0_material
        objectName: "mirror_inside.0"
        baseColor: "#ffcccccc"
        metalness: 1
        roughness: 0.20178726315498352
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: glass_0_material
        objectName: "glass.0"
        baseColor: "#9fffffff"
        baseColorMap: textures_glass_0_baseColor_png_texture
        roughness: 0.22002778947353363
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Blend
    }
    PrincipledMaterial {
        id: glass_1_material
        objectName: "glass.1"
        baseColor: "#a9ffffff"
        baseColorMap: textures_glass_1_baseColor_png_texture
        roughness: 0.2625890076160431
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Blend
    }
    PrincipledMaterial {
        id: platnomor_1_material
        objectName: "platnomor.1"
        baseColor: "#ffa3a3a3"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: indicator_lr_material
        objectName: "indicator_lr"
        baseColor: "#ffb5ff00"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: door_lf_0_material
        objectName: "door_lf.0"
        baseColor: "#ff131313"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: door_lf_5_material
        objectName: "door_lf.5"
        baseColor: "#ff0b0b0b"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: primary_002_material
        objectName: "primary.002"
        baseColorMap: textures_primary_002_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: hub_rb_0_material
        objectName: "hub_rb.0"
        baseColorMap: textures_hub_rb_0_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: primary_004_material
        objectName: "primary.004"
        baseColor: "#ff3cff00"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: light_pantulan_0_material
        objectName: "light_pantulan.0"
        baseColorMap: textures_light_pantulan_0_baseColor_png_texture
        roughness: 1
        emissiveMap: textures_light_pantulan_0_baseColor_png_texture
        emissiveFactor: Qt.vector3d(1, 1, 1)
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: wheels_2_material
        objectName: "wheels.2"
        baseColorMap: textures_wheels_2_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: wheels_0_material
        objectName: "wheels.0"
        baseColorMap: textures_movsteer_1_0_1_baseColor_png_texture
        roughness: 0.8235020041465759
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: wheels_3_material
        objectName: "wheels.3"
        baseColorMap: textures_wheels_3_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: hub_rf_0_material
        objectName: "hub_rf.0"
        baseColorMap: textures_hub_rb_0_baseColor_png_texture
        roughness: 0.6925175786018372
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: wheels_4_material
        objectName: "wheels.4"
        baseColorMap: textures_wheels_4_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: wheels_6_material
        objectName: "wheels.6"
        baseColorMap: textures_wheels_6_baseColor_png_texture
        roughness: 0.6837722063064575
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: hub_rf_1_material
        objectName: "hub_rf.1"
        baseColorMap: textures_hub_rf_1_baseColor_png_texture
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Node {
        id: sketchfab_model
        objectName: "Sketchfab_model"
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        Node {
            id: node888d5b4c0a7b42299d217c2edec42266_fbx
            objectName: "888d5b4c0a7b42299d217c2edec42266.fbx"
            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
            Node {
                id: rootNode
                objectName: "RootNode"
                Node {
                    id: tesla_Model_3
                    objectName: "Tesla Model 3"
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale: Qt.vector3d(100, 100, 100)
                    Node {
                        id: hub_rb
                        objectName: "hub_rb"
                        position: Qt.vector3d(0.898338, -1.44654, -0.37177)
                        rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                        Model {
                            id: hub_rb_hub_rb_0_0
                            objectName: "hub_rb_hub_rb.0_0"
                            source: "meshes/hub_rb_hub_rb_0_0_mesh.mesh"
                            materials: [hub_rb_0_material]
                        }
                    }
                    Node {
                        id: hub_lb
                        objectName: "hub_lb"
                        position: Qt.vector3d(-0.898226, -1.44647, -0.37177)
                        rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                        Model {
                            id: hub_lb_hub_rb_0_0
                            objectName: "hub_lb_hub_rb.0_0"
                            source: "meshes/hub_lb_hub_rb_0_0_mesh.mesh"
                            materials: [hub_rb_0_material]
                        }
                    }
                    Node {
                        id: hub_rf
                        objectName: "hub_rf"
                        position: Qt.vector3d(0.924155, 1.7566, -0.371791)
                        rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                        Model {
                            id: hub_rf_hub_rf_0_0
                            objectName: "hub_rf_hub_rf.0_0"
                            source: "meshes/hub_rf_hub_rf_0_0_mesh.mesh"
                            materials: [hub_rf_0_material]
                        }
                        Model {
                            id: hub_rf_hub_rf_1_0
                            objectName: "hub_rf_hub_rf.1_0"
                            source: "meshes/hub_rf_hub_rf_1_0_mesh.mesh"
                            materials: [hub_rf_1_material]
                        }
                    }
                    Node {
                        id: hub_lf
                        objectName: "hub_lf"
                        position: Qt.vector3d(-0.924874, 1.7566, -0.371791)
                        rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                        Model {
                            id: hub_lf_hub_rf_0_0
                            objectName: "hub_lf_hub_rf.0_0"
                            source: "meshes/hub_lf_hub_rf_0_0_mesh.mesh"
                            materials: [hub_rf_0_material]
                        }
                        Model {
                            id: hub_lf_hub_rf_1_0
                            objectName: "hub_lf_hub_rf.1_0"
                            source: "meshes/hub_lf_hub_rf_1_0_mesh.mesh"
                            materials: [hub_rf_1_material]
                        }
                    }
                    Node {
                        id: dvornik_dummy
                        objectName: "dvornik_dummy"
                        position: Qt.vector3d(-0.0828764, 1.60456, 0.17731)
                        rotation: Qt.quaternion(0.887997, 0.45985, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: dvorright
                            objectName: "dvorright"
                            position: Qt.vector3d(-7.07954e-05, 4.80413e-05,
                                                  -6.19888e-05)
                            rotation: Qt.quaternion(1, -8.60423e-16, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                            Model {
                                id: dvorright_dvorright_0_0
                                objectName: "dvorright_dvorright.0_0"
                                source: "meshes/dvorright_dvorright_0_0_mesh.mesh"
                                materials: [dvorright_0_material]
                            }
                        }
                        Node {
                            id: other
                            objectName: "other"
                            position: Qt.vector3d(-0.622816,
                                                  -0.0792368, 0.170684)
                            rotation: Qt.quaternion(0.997805, 0.066214, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: dvorleft
                                objectName: "dvorleft"
                                position: Qt.vector3d(-7.08699e-05,
                                                      3.91603e-05, -6.78301e-05)
                                rotation: Qt.quaternion(1, -5.55111e-17, 0, 0)
                                scale: Qt.vector3d(1, 1, 1)
                                Model {
                                    id: dvorleft_dvorright_0_0
                                    objectName: "dvorleft_dvorright.0_0"
                                    source: "meshes/dvorleft_dvorright_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                            }
                        }
                    }
                    Node {
                        id: steering_dummy
                        objectName: "steering_dummy"
                        position: Qt.vector3d(-0.469958, 0.60791, 0.17581)
                        rotation: Qt.quaternion(0.988195, -0.153201, 0, 0)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: movsteer_1_0
                            objectName: "movsteer_1.0"
                            position: Qt.vector3d(7.42078e-06, 5.00679e-06,
                                                  6.85453e-07)
                            rotation: Qt.quaternion(1, -1.49012e-08, 0, 0)
                            scale: Qt.vector3d(1, 1, 1)
                            Model {
                                id: movsteer_1_0_movsteer_1_0_1_0
                                objectName: "movsteer_1.0_movsteer_1.0.1_0"
                                source: "meshes/movsteer_1_0_movsteer_1_0_1_0_mesh.mesh"
                                materials: [movsteer_1_0_1_material]
                            }
                            Model {
                                id: movsteer_1_0_movsteer_1_0_0_0
                                objectName: "movsteer_1.0_movsteer_1.0.0_0"
                                source: "meshes/movsteer_1_0_movsteer_1_0_0_0_mesh.mesh"
                                materials: [movsteer_1_0_0_material]
                            }
                            Model {
                                id: movsteer_1_0_dvorright_0_0
                                objectName: "movsteer_1.0_dvorright.0_0"
                                source: "meshes/movsteer_1_0_dvorright_0_0_mesh.mesh"
                                materials: [dvorright_0_material]
                            }
                        }
                    }
                    Node {
                        id: chassis_dummy
                        objectName: "chassis_dummy"
                        rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                        Node {
                            id: chassis
                            objectName: "chassis"
                            position: Qt.vector3d(0, 1.77061, -0.362406)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Model {
                                id: chassis_chassis_0_0
                                objectName: "chassis_chassis.0_0"
                                source: "meshes/chassis_chassis_0_0_mesh.mesh"
                                materials: [chassis_0_material]
                            }
                            Node {
                                id: just_BLACK
                                objectName: "JUST_BLACK"
                                position: Qt.vector3d(0, -1.77061, 0.362406)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: just_BLACK_JUST_BLACK_0_0
                                    objectName: "JUST_BLACK_JUST_BLACK.0_0"
                                    source: "meshes/just_BLACK_JUST_BLACK_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Node {
                                    id: just_BLACK_001
                                    objectName: "JUST_BLACK.001"
                                    Model {
                                        id: just_BLACK_001_JUST_BLACK_0_0
                                        objectName: "JUST_BLACK.001_JUST_BLACK.0_0"
                                        source: "meshes/just_BLACK_001_JUST_BLACK_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                            }
                            Node {
                                id: body
                                objectName: "body"
                                position: Qt.vector3d(0, -1.77061, 0.362406)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: body_primary_0
                                    objectName: "body_primary_0"
                                    source: "meshes/body_primary_0_mesh.mesh"
                                    materials: [primary_material]
                                }
                            }
                            Node {
                                id: bodysills
                                objectName: "bodysills"
                                position: Qt.vector3d(0, -1.77061, 0.362406)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: bodysills_primary_001_0
                                    objectName: "bodysills_primary.001_0"
                                    source: "meshes/bodysills_primary_001_0_mesh.mesh"
                                    materials: [primary_001_material]
                                }
                            }
                            Node {
                                id: black_lights
                                objectName: "black_lights"
                                position: Qt.vector3d(0, -1.77061, 0.362406)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: black_lights_black_lights_0_0
                                    objectName: "black_lights_black_lights.0_0"
                                    source: "meshes/black_lights_black_lights_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Node {
                                    id: _satin_black_134
                                    objectName: "_satin_black_134"
                                    Model {
                                        id: _satin_black_134_black_lights_0_0
                                        objectName: "_satin_black_134_black_lights.0_0"
                                        source: "meshes/_satin_black_134_black_lights_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                    Node {
                                        id: _plastic_black_124
                                        objectName: "_plastic_black_124"
                                        rotation: Qt.quaternion(1,
                                                                -2.64698e-23,
                                                                0, 0)
                                        Model {
                                            id: _plastic_black_124_black_lights_0_0
                                            objectName: "_plastic_black_124_black_lights.0_0"
                                            source: "meshes/_plastic_black_124_black_lights_0_0_mesh.mesh"
                                            materials: [dvorright_0_material]
                                        }
                                    }
                                }
                                Node {
                                    id: back_chrome_light
                                    objectName: "back_chrome_light"
                                    Model {
                                        id: back_chrome_light_back_chrome_light_0_0
                                        objectName: "back_chrome_light_back_chrome_light.0_0"
                                        source: "meshes/back_chrome_light_back_chrome_light_0_0_mesh.mesh"
                                        materials: [back_chrome_light_0_material]
                                    }
                                    Node {
                                        id: pantulans
                                        objectName: "pantulans"
                                        rotation: Qt.quaternion(1,
                                                                -2.64698e-23,
                                                                0, 0)
                                        Model {
                                            id: pantulans_pantulans_0_0
                                            objectName: "pantulans_pantulans.0_0"
                                            source: "meshes/pantulans_pantulans_0_0_mesh.mesh"
                                            materials: [pantulans_0_material]
                                        }
                                    }
                                    Node {
                                        id: rear_lights
                                        objectName: "rear_lights"
                                        rotation: Qt.quaternion(1,
                                                                -2.64698e-23,
                                                                0, 0)
                                        Model {
                                            id: rear_lights_right_rear_light_0
                                            objectName: "rear_lights_right rear light_0"
                                            source: "meshes/rear_lights_right_rear_light_0_mesh.mesh"
                                            materials: [right_rear_light_material]
                                        }
                                    }
                                    Node {
                                        id: light_breake
                                        objectName: "light_breake"
                                        rotation: Qt.quaternion(1,
                                                                -2.64698e-23,
                                                                0, 0)
                                        Model {
                                            id: light_breake_breaklight_l_0
                                            objectName: "light_breake_breaklight l_0"
                                            source: "meshes/light_breake_breaklight_l_0_mesh.mesh"
                                            materials: [breaklight_l_material]
                                        }
                                    }
                                }
                                Node {
                                    id: chrome_foglight_r
                                    objectName: "chrome_foglight_r"
                                    Model {
                                        id: chrome_foglight_r_foglight_r_0
                                        objectName: "chrome_foglight_r_foglight r_0"
                                        source: "meshes/chrome_foglight_r_foglight_r_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: chrome_foglight_l
                                    objectName: "chrome_foglight_l"
                                    Model {
                                        id: chrome_foglight_l_foglight_l_0
                                        objectName: "chrome_foglight_l_foglight l_0"
                                        source: "meshes/chrome_foglight_l_foglight_l_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: chrome_Lights_head_l
                                    objectName: "chrome_Lights_head_l"
                                    Model {
                                        id: chrome_Lights_head_l_right_front_light_0
                                        objectName: "chrome_Lights_head_l_right front light_0"
                                        source: "meshes/chrome_Lights_head_l_right_front_light_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                    Model {
                                        id: chrome_Lights_head_l_left_front_light_0
                                        objectName: "chrome_Lights_head_l_left front light_0"
                                        source: "meshes/chrome_Lights_head_l_left_front_light_0_mesh.mesh"
                                        materials: [right_rear_light_material]
                                    }
                                }
                                Node {
                                    id: chrome
                                    objectName: "chrome"
                                    Model {
                                        id: chrome_movsteer_1_0_1_0
                                        objectName: "chrome_movsteer_1.0.1_0"
                                        source: "meshes/chrome_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: breake_int
                                    objectName: "breake_int"
                                    Model {
                                        id: breake_int_breaklight_l_0
                                        objectName: "breake_int_breaklight l_0"
                                        source: "meshes/breake_int_breaklight_l_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: aluminium_light
                                    objectName: "aluminium_light"
                                    Model {
                                        id: aluminium_light_aluminium_light_0_0
                                        objectName: "aluminium_light_aluminium_light.0_0"
                                        source: "meshes/aluminium_light_aluminium_light_0_0_mesh.mesh"
                                        materials: [aluminium_light_0_material]
                                    }
                                }
                                Node {
                                    id: tembus_red
                                    objectName: "tembus red"
                                    Model {
                                        id: tembus_red_tembus_red_0_0
                                        objectName: "tembus red_tembus red.0_0"
                                        source: "meshes/tembus_red_tembus_red_0_0_mesh.mesh"
                                        materials: [tembus_red_0_material]
                                    }
                                }
                                Node {
                                    id: interiorlights
                                    objectName: "interiorlights"
                                    Model {
                                        id: interiorlights_light_night_0
                                        objectName: "interiorlights_light night_0"
                                        source: "meshes/interiorlights_light_night_0_mesh.mesh"
                                        materials: [right_rear_light_material]
                                    }
                                }
                                Node {
                                    id: turn_indicat_l
                                    objectName: "turn_indicat_l"
                                    position: Qt.vector3d(0.00181705, 0, 0)
                                    Model {
                                        id: turn_indicat_l_indicator_lf_0
                                        objectName: "turn_indicat_l_indicator lf_0"
                                        source: "meshes/turn_indicat_l_indicator_lf_0_mesh.mesh"
                                        materials: [right_rear_light_material]
                                    }
                                }
                                Node {
                                    id: turn_indicat_r
                                    objectName: "turn_indicat_r"
                                    position: Qt.vector3d(0.00181705, 0, 0)
                                    Model {
                                        id: turn_indicat_r_indicator_rf_0
                                        objectName: "turn_indicat_r_indicator rf_0"
                                        source: "meshes/turn_indicat_r_indicator_rf_0_mesh.mesh"
                                        materials: [right_rear_light_material]
                                    }
                                }
                            }
                            Node {
                                id: base
                                objectName: "base"
                                position: Qt.vector3d(0, -1.77061, 0.362406)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: base_dvorright_0_0
                                    objectName: "base_dvorright.0_0"
                                    source: "meshes/base_dvorright_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Node {
                                    id: hitam
                                    objectName: "hitam"
                                    Model {
                                        id: hitam_dvorright_0_0
                                        objectName: "hitam_dvorright.0_0"
                                        source: "meshes/hitam_dvorright_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: hitam_001
                                    objectName: "hitam.001"
                                    Model {
                                        id: hitam_001_dvorright_0_0
                                        objectName: "hitam.001_dvorright.0_0"
                                        source: "meshes/hitam_001_dvorright_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: hitam_002
                                    objectName: "hitam.002"
                                    Model {
                                        id: hitam_002_hitam_0_0
                                        objectName: "hitam.002_hitam.0_0"
                                        source: "meshes/hitam_002_hitam_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: plastic
                                    objectName: "Plastic"
                                    Model {
                                        id: plastic_Plastic_0_0
                                        objectName: "Plastic_Plastic.0_0"
                                        source: "meshes/plastic_Plastic_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: belt
                                    objectName: "belt"
                                    Model {
                                        id: belt_belt_0_0
                                        objectName: "belt_belt.0_0"
                                        source: "meshes/belt_belt_0_0_mesh.mesh"
                                        materials: [belt_0_material]
                                    }
                                }
                                Node {
                                    id: black
                                    objectName: "black"
                                    Model {
                                        id: black_black_lights_0_0
                                        objectName: "black_black_lights.0_0"
                                        source: "meshes/black_black_lights_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: satin_red
                                    objectName: "satin_red"
                                    Model {
                                        id: satin_red_satin_red_0_0
                                        objectName: "satin_red_satin_red.0_0"
                                        source: "meshes/satin_red_satin_red_0_0_mesh.mesh"
                                        materials: [satin_red_0_material]
                                    }
                                }
                                Node {
                                    id: paint_black
                                    objectName: "paint_black"
                                    Model {
                                        id: paint_black_dvorright_0_0
                                        objectName: "paint_black_dvorright.0_0"
                                        source: "meshes/paint_black_dvorright_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: cahrome
                                    objectName: "cahrome"
                                    Model {
                                        id: cahrome_movsteer_1_0_1_0
                                        objectName: "cahrome_movsteer_1.0.1_0"
                                        source: "meshes/cahrome_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: suspensi
                                    objectName: "suspensi"
                                    Model {
                                        id: suspensi_suspensi_0_0
                                        objectName: "suspensi_suspensi.0_0"
                                        source: "meshes/suspensi_suspensi_0_0_mesh.mesh"
                                        materials: [back_chrome_light_0_material]
                                    }
                                    Model {
                                        id: suspensi_suspensi_1_0
                                        objectName: "suspensi_suspensi.1_0"
                                        source: "meshes/suspensi_suspensi_1_0_mesh.mesh"
                                        materials: [back_chrome_light_0_material]
                                    }
                                }
                                Node {
                                    id: chrome_
                                    objectName: "chrome_"
                                    Model {
                                        id: chrome__movsteer_1_0_1_0
                                        objectName: "chrome__movsteer_1.0.1_0"
                                        source: "meshes/chrome__movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: chrome1
                                    objectName: "chrome1"
                                    Model {
                                        id: chrome1_movsteer_1_0_1_0
                                        objectName: "chrome1_movsteer_1.0.1_0"
                                        source: "meshes/chrome1_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: chrome2
                                    objectName: "chrome2"
                                    Model {
                                        id: chrome2_movsteer_1_0_1_0
                                        objectName: "chrome2_movsteer_1.0.1_0"
                                        source: "meshes/chrome2_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: hitam_003
                                    objectName: "hitam.003"
                                    Model {
                                        id: hitam_003_dvorright_0_0
                                        objectName: "hitam.003_dvorright.0_0"
                                        source: "meshes/hitam_003_dvorright_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: hitam_004
                                    objectName: "hitam.004"
                                    Model {
                                        id: hitam_004_dvorright_0_0
                                        objectName: "hitam.004_dvorright.0_0"
                                        source: "meshes/hitam_004_dvorright_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: aluminium
                                    objectName: "aluminium"
                                    Model {
                                        id: aluminium_movsteer_1_0_1_0
                                        objectName: "aluminium_movsteer_1.0.1_0"
                                        source: "meshes/aluminium_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: hitam_005
                                    objectName: "hitam.005"
                                    Model {
                                        id: hitam_005_Plastic_0_0
                                        objectName: "hitam.005_Plastic.0_0"
                                        source: "meshes/hitam_005_Plastic_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: hitam_006
                                    objectName: "hitam.006"
                                    Model {
                                        id: hitam_006_black_lights_0_0
                                        objectName: "hitam.006_black_lights.0_0"
                                        source: "meshes/hitam_006_black_lights_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: texture_Leather
                                    objectName: "texture_Leather"
                                    Model {
                                        id: texture_Leather_movsteer_1_0_0_0
                                        objectName: "texture_Leather_movsteer_1.0.0_0"
                                        source: "meshes/texture_Leather_movsteer_1_0_0_0_mesh.mesh"
                                        materials: [movsteer_1_0_0_material]
                                    }
                                }
                                Node {
                                    id: texture_Leather_001
                                    objectName: "texture_Leather.001"
                                    Model {
                                        id: texture_Leather_001_movsteer_1_0_0_0
                                        objectName: "texture_Leather.001_movsteer_1.0.0_0"
                                        source: "meshes/texture_Leather_001_movsteer_1_0_0_0_mesh.mesh"
                                        materials: [movsteer_1_0_0_material]
                                    }
                                }
                                Node {
                                    id: aluminium2
                                    objectName: "aluminium2"
                                    Model {
                                        id: aluminium2_aluminium2_0_0
                                        objectName: "aluminium2_aluminium2.0_0"
                                        source: "meshes/aluminium2_aluminium2_0_0_mesh.mesh"
                                        materials: [aluminium_light_0_material]
                                    }
                                }
                                Node {
                                    id: frunkplastic
                                    objectName: "frunkplastic"
                                    Model {
                                        id: frunkplastic_dvorright_0_0
                                        objectName: "frunkplastic_dvorright.0_0"
                                        source: "meshes/frunkplastic_dvorright_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: putih
                                    objectName: "Putih"
                                    Model {
                                        id: putih_Putih_0_0
                                        objectName: "Putih_Putih.0_0"
                                        source: "meshes/putih_Putih_0_0_mesh.mesh"
                                        materials: [putih_0_material]
                                    }
                                }
                                Node {
                                    id: whiteleather
                                    objectName: "whiteleather"
                                    Model {
                                        id: whiteleather_Putih_0_0
                                        objectName: "whiteleather_Putih.0_0"
                                        source: "meshes/whiteleather_Putih_0_0_mesh.mesh"
                                        materials: [putih_0_material]
                                    }
                                }
                                Node {
                                    id: putih_001
                                    objectName: "Putih.001"
                                    Model {
                                        id: putih_001_Putih_0_0
                                        objectName: "Putih.001_Putih.0_0"
                                        source: "meshes/putih_001_Putih_0_0_mesh.mesh"
                                        materials: [putih_0_material]
                                    }
                                }
                                Node {
                                    id: putih_002
                                    objectName: "Putih.002"
                                    Model {
                                        id: putih_002_Putih_0_0
                                        objectName: "Putih.002_Putih.0_0"
                                        source: "meshes/putih_002_Putih_0_0_mesh.mesh"
                                        materials: [putih_0_material]
                                    }
                                }
                                Node {
                                    id: carpet
                                    objectName: "Carpet"
                                    Model {
                                        id: carpet_Carpet_0_0
                                        objectName: "Carpet_Carpet.0_0"
                                        source: "meshes/carpet_Carpet_0_0_mesh.mesh"
                                        materials: [movsteer_1_0_0_material]
                                    }
                                }
                                Node {
                                    id: black_001
                                    objectName: "black.001"
                                    Model {
                                        id: black_001_Plastic_0_0
                                        objectName: "black.001_Plastic.0_0"
                                        source: "meshes/black_001_Plastic_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: black_002
                                    objectName: "black.002"
                                    Model {
                                        id: black_002_Plastic_0_0
                                        objectName: "black.002_Plastic.0_0"
                                        source: "meshes/black_002_Plastic_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: black_003
                                    objectName: "black.003"
                                    Model {
                                        id: black_003_black_lights_0_0
                                        objectName: "black.003_black_lights.0_0"
                                        source: "meshes/black_003_black_lights_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: black_004
                                    objectName: "black.004"
                                    Model {
                                        id: black_004_JUST_BLACK_0_0
                                        objectName: "black.004_JUST_BLACK.0_0"
                                        source: "meshes/black_004_JUST_BLACK_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: black_005
                                    objectName: "black.005"
                                    Model {
                                        id: black_005_black_lights_0_0
                                        objectName: "black.005_black_lights.0_0"
                                        source: "meshes/black_005_black_lights_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                }
                                Node {
                                    id: carpet_Light
                                    objectName: "Carpet_Light"
                                    Model {
                                        id: carpet_Light_Carpet_Light_0_0
                                        objectName: "Carpet_Light_Carpet_Light.0_0"
                                        source: "meshes/carpet_Light_Carpet_Light_0_0_mesh.mesh"
                                        materials: [carpet_Light_0_material]
                                    }
                                }
                                Node {
                                    id: chromeBELT
                                    objectName: "chromeBELT"
                                    Model {
                                        id: chromeBELT_movsteer_1_0_1_0
                                        objectName: "chromeBELT_movsteer_1.0.1_0"
                                        source: "meshes/chromeBELT_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: suspensi2
                                    objectName: "suspensi2"
                                    Model {
                                        id: suspensi2_suspensi_0_0
                                        objectName: "suspensi2_suspensi.0_0"
                                        source: "meshes/suspensi2_suspensi_0_0_mesh.mesh"
                                        materials: [back_chrome_light_0_material]
                                    }
                                    Model {
                                        id: suspensi2_suspensi_1_0
                                        objectName: "suspensi2_suspensi.1_0"
                                        source: "meshes/suspensi2_suspensi_1_0_mesh.mesh"
                                        materials: [back_chrome_light_0_material]
                                    }
                                }
                                Node {
                                    id: texture_Buttons
                                    objectName: "texture_Buttons"
                                    Model {
                                        id: texture_Buttons_texture_Buttons_0_0
                                        objectName: "texture_Buttons_texture_Buttons.0_0"
                                        source: "meshes/texture_Buttons_texture_Buttons_0_0_mesh.mesh"
                                        materials: [texture_Buttons_0_material]
                                    }
                                }
                                Node {
                                    id: lcds
                                    objectName: "LCDs"
                                    Model {
                                        id: lcds_LCDs_0_0
                                        objectName: "LCDs_LCDs.0_0"
                                        source: "meshes/lcds_LCDs_0_0_mesh.mesh"
                                        materials: [lcds_0_material]
                                    }
                                }
                                Node {
                                    id: seat_Leather_white
                                    objectName: "Seat Leather white"
                                    Model {
                                        id: seat_Leather_white_Seat_Leather_white_0_0
                                        objectName: "Seat Leather white_Seat Leather white.0_0"
                                        source: "meshes/seat_Leather_white_Seat_Leather_white_0_0_mesh.mesh"
                                        materials: [putih_0_material]
                                    }
                                    Node {
                                        id: leather_white
                                        objectName: "Leather_white"
                                        rotation: Qt.quaternion(1,
                                                                -2.64698e-23,
                                                                0, 0)
                                        Model {
                                            id: leather_white_Seat_Leather_white_0_0
                                            objectName: "Leather_white_Seat Leather white.0_0"
                                            source: "meshes/leather_white_Seat_Leather_white_0_0_mesh.mesh"
                                            materials: [putih_0_material]
                                        }
                                    }
                                }
                                Node {
                                    id: mirror_inside
                                    objectName: "mirror_inside"
                                    Model {
                                        id: mirror_inside_mirror_inside_0_0
                                        objectName: "mirror_inside_mirror_inside.0_0"
                                        source: "meshes/mirror_inside_mirror_inside_0_0_mesh.mesh"
                                        materials: [mirror_inside_0_material]
                                    }
                                }
                            }
                            Node {
                                id: glass
                                objectName: "glass"
                                position: Qt.vector3d(0, -1.04158, 0.93493)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: glass_glass_0_0
                                    objectName: "glass_glass.0_0"
                                    source: "meshes/glass_glass_0_0_mesh.mesh"
                                    materials: [glass_0_material]
                                }
                                Model {
                                    id: glass_glass_1_0
                                    objectName: "glass_glass.1_0"
                                    source: "meshes/glass_glass_1_0_mesh.mesh"
                                    materials: [glass_1_material]
                                }
                            }
                        }
                        Node {
                            id: boot_dummy
                            objectName: "boot_dummy"
                            position: Qt.vector3d(0, -1.69223, 0.597245)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: black_boot
                                objectName: "black_boot"
                                position: Qt.vector3d(0, 8.46386e-06,
                                                      1.51396e-05)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: black_boot_black_lights_0_0
                                    objectName: "black_boot_black_lights.0_0"
                                    source: "meshes/black_boot_black_lights_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Node {
                                    id: boot
                                    objectName: "boot"
                                    position: Qt.vector3d(0, -2.15769e-05,
                                                          -1.09673e-05)
                                    Model {
                                        id: boot_primary_0
                                        objectName: "boot_primary_0"
                                        source: "meshes/boot_primary_0_mesh.mesh"
                                        materials: [primary_material]
                                    }
                                }
                                Node {
                                    id: platnomor
                                    objectName: "platnomor"
                                    Model {
                                        id: platnomor_JUST_BLACK_0_0
                                        objectName: "platnomor_JUST_BLACK.0_0"
                                        source: "meshes/platnomor_JUST_BLACK_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                    Model {
                                        id: platnomor_platnomor_1_0
                                        objectName: "platnomor_platnomor.1_0"
                                        source: "meshes/platnomor_platnomor_1_0_mesh.mesh"
                                        materials: [platnomor_1_material]
                                    }
                                    Model {
                                        id: platnomor_hitam_0_0
                                        objectName: "platnomor_hitam.0_0"
                                        source: "meshes/platnomor_hitam_0_0_mesh.mesh"
                                        materials: [dvorright_0_material]
                                    }
                                    Model {
                                        id: platnomor_platnomor_2_0
                                        objectName: "platnomor_platnomor.2_0"
                                        source: "meshes/platnomor_platnomor_2_0_mesh.mesh"
                                        materials: [chassis_0_material]
                                    }
                                }
                                Node {
                                    id: chrome_001
                                    objectName: "chrome.001"
                                    Model {
                                        id: chrome_001_movsteer_1_0_1_0
                                        objectName: "chrome.001_movsteer_1.0.1_0"
                                        source: "meshes/chrome_001_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                                Node {
                                    id: light_turn_rr_boot
                                    objectName: "light_turn_rr_boot"
                                    Model {
                                        id: light_turn_rr_boot_indicator_rr_0
                                        objectName: "light_turn_rr_boot_indicator rr_0"
                                        source: "meshes/light_turn_rr_boot_indicator_rr_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: light_turn_lr_boot
                                    objectName: "light_turn_lr_boot"
                                    Model {
                                        id: light_turn_lr_boot_indicator_lr_0
                                        objectName: "light_turn_lr_boot_indicator lr_0"
                                        source: "meshes/light_turn_lr_boot_indicator_lr_0_mesh.mesh"
                                        materials: [indicator_lr_material]
                                    }
                                }
                                Node {
                                    id: chrome_light
                                    objectName: "chrome_light"
                                    Model {
                                        id: chrome_light_back_chrome_light_0_0
                                        objectName: "chrome_light_back_chrome_light.0_0"
                                        source: "meshes/chrome_light_back_chrome_light_0_0_mesh.mesh"
                                        materials: [back_chrome_light_0_material]
                                    }
                                }
                                Node {
                                    id: rear_lightsr
                                    objectName: "rear_lightsr"
                                    Model {
                                        id: rear_lightsr_right_rear_light_0
                                        objectName: "rear_lightsr_right rear light_0"
                                        source: "meshes/rear_lightsr_right_rear_light_0_mesh.mesh"
                                        materials: [right_rear_light_material]
                                    }
                                }
                                Node {
                                    id: rear_lightsl
                                    objectName: "rear_lightsl"
                                    Model {
                                        id: rear_lightsl_left_rear_light_0
                                        objectName: "rear_lightsl_left rear light_0"
                                        source: "meshes/rear_lightsl_left_rear_light_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: lightrevese_boot
                                    objectName: "lightrevese_boot"
                                    Model {
                                        id: lightrevese_boot_revlight_L_0
                                        objectName: "lightrevese_boot_revlight L_0"
                                        source: "meshes/lightrevese_boot_revlight_L_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: tembus_boot_ok
                                    objectName: "tembus_boot_ok"
                                    Model {
                                        id: tembus_boot_ok_tembus_red_0_0
                                        objectName: "tembus_boot_ok_tembus red.0_0"
                                        source: "meshes/tembus_boot_ok_tembus_red_0_0_mesh.mesh"
                                        materials: [tembus_red_0_material]
                                    }
                                }
                            }
                        }
                        Node {
                            id: door_lf_dummy
                            objectName: "door_lf_dummy"
                            position: Qt.vector3d(-1.00598, 1.17528, -0.0625812)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: door_lf
                                objectName: "door_lf"
                                position: Qt.vector3d(7.39098e-06,
                                                      -4.17233e-06, 6.93649e-06)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: door_lf_JUST_BLACK_0_0
                                    objectName: "door_lf_JUST_BLACK.0_0"
                                    source: "meshes/door_lf_JUST_BLACK_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_lf_texture_Buttons_0_0
                                    objectName: "door_lf_texture_Buttons.0_0"
                                    source: "meshes/door_lf_texture_Buttons_0_0_mesh.mesh"
                                    materials: [texture_Buttons_0_material]
                                }
                                Model {
                                    id: door_lf_movsteer_1_0_1_0
                                    objectName: "door_lf_movsteer_1.0.1_0"
                                    source: "meshes/door_lf_movsteer_1_0_1_0_mesh.mesh"
                                    materials: [movsteer_1_0_1_material]
                                }
                                Model {
                                    id: door_lf_movsteer_1_0_0_0
                                    objectName: "door_lf_movsteer_1.0.0_0"
                                    source: "meshes/door_lf_movsteer_1_0_0_0_mesh.mesh"
                                    materials: [movsteer_1_0_0_material]
                                }
                                Model {
                                    id: door_lf_Putih_0_0
                                    objectName: "door_lf_Putih.0_0"
                                    source: "meshes/door_lf_Putih_0_0_mesh.mesh"
                                    materials: [putih_0_material]
                                }
                                Model {
                                    id: door_lf_Plastic_0_0
                                    objectName: "door_lf_Plastic.0_0"
                                    source: "meshes/door_lf_Plastic_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_lf_aluminium2_0_0
                                    objectName: "door_lf_aluminium2.0_0"
                                    source: "meshes/door_lf_aluminium2_0_0_mesh.mesh"
                                    materials: [aluminium_light_0_material]
                                }
                                Model {
                                    id: door_lf_dvorright_0_0
                                    objectName: "door_lf_dvorright.0_0"
                                    source: "meshes/door_lf_dvorright_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_lf_door_lf_0_0
                                    objectName: "door_lf_door_lf.0_0"
                                    source: "meshes/door_lf_door_lf_0_0_mesh.mesh"
                                    materials: [door_lf_0_material]
                                }
                                Model {
                                    id: door_lf_door_lf_5_0
                                    objectName: "door_lf_door_lf.5_0"
                                    source: "meshes/door_lf_door_lf_5_0_mesh.mesh"
                                    materials: [door_lf_5_material]
                                }
                                Model {
                                    id: door_lf_glass_0_0
                                    objectName: "door_lf_glass.0_0"
                                    source: "meshes/door_lf_glass_0_0_mesh.mesh"
                                    materials: [glass_0_material]
                                }
                                Model {
                                    id: door_lf_mirror_inside_0_0
                                    objectName: "door_lf_mirror_inside.0_0"
                                    source: "meshes/door_lf_mirror_inside_0_0_mesh.mesh"
                                    materials: [mirror_inside_0_material]
                                }
                                Model {
                                    id: door_lf_primary_0
                                    objectName: "door_lf_primary_0"
                                    source: "meshes/door_lf_primary_0_mesh.mesh"
                                    materials: [primary_material]
                                }
                                Model {
                                    id: door_lf_primary_002_0
                                    objectName: "door_lf_primary.002_0"
                                    source: "meshes/door_lf_primary_002_0_mesh.mesh"
                                    materials: [primary_002_material]
                                }
                                Node {
                                    id: door_lf_ok
                                    objectName: "door_lf_ok"
                                    Model {
                                        id: door_lf_ok_primary_0
                                        objectName: "door_lf_ok_primary_0"
                                        source: "meshes/door_lf_ok_primary_0_mesh.mesh"
                                        materials: [primary_material]
                                    }
                                }
                            }
                        }
                        Node {
                            id: door_lr_dummy
                            objectName: "door_lr_dummy"
                            position: Qt.vector3d(-1.03329, -0.13056,
                                                  -0.0625833)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: door_lr
                                objectName: "door_lr"
                                position: Qt.vector3d(5.84126e-06, 7.59959e-07,
                                                      -5.58794e-07)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: door_lr_JUST_BLACK_0_0
                                    objectName: "door_lr_JUST_BLACK.0_0"
                                    source: "meshes/door_lr_JUST_BLACK_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_lr_texture_Buttons_0_0
                                    objectName: "door_lr_texture_Buttons.0_0"
                                    source: "meshes/door_lr_texture_Buttons_0_0_mesh.mesh"
                                    materials: [texture_Buttons_0_material]
                                }
                                Model {
                                    id: door_lr_primary_004_0
                                    objectName: "door_lr_primary.004_0"
                                    source: "meshes/door_lr_primary_004_0_mesh.mesh"
                                    materials: [primary_004_material]
                                }
                                Model {
                                    id: door_lr_movsteer_1_0_1_0
                                    objectName: "door_lr_movsteer_1.0.1_0"
                                    source: "meshes/door_lr_movsteer_1_0_1_0_mesh.mesh"
                                    materials: [movsteer_1_0_1_material]
                                }
                                Model {
                                    id: door_lr_movsteer_1_0_0_0
                                    objectName: "door_lr_movsteer_1.0.0_0"
                                    source: "meshes/door_lr_movsteer_1_0_0_0_mesh.mesh"
                                    materials: [movsteer_1_0_0_material]
                                }
                                Model {
                                    id: door_lr_Putih_0_0
                                    objectName: "door_lr_Putih.0_0"
                                    source: "meshes/door_lr_Putih_0_0_mesh.mesh"
                                    materials: [putih_0_material]
                                }
                                Model {
                                    id: door_lr_Plastic_0_0
                                    objectName: "door_lr_Plastic.0_0"
                                    source: "meshes/door_lr_Plastic_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_lr_aluminium2_0_0
                                    objectName: "door_lr_aluminium2.0_0"
                                    source: "meshes/door_lr_aluminium2_0_0_mesh.mesh"
                                    materials: [aluminium_light_0_material]
                                }
                                Model {
                                    id: door_lr_dvorright_0_0
                                    objectName: "door_lr_dvorright.0_0"
                                    source: "meshes/door_lr_dvorright_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_lr_glass_0_0
                                    objectName: "door_lr_glass.0_0"
                                    source: "meshes/door_lr_glass_0_0_mesh.mesh"
                                    materials: [glass_0_material]
                                }
                                Model {
                                    id: door_lr_primary_0
                                    objectName: "door_lr_primary_0"
                                    source: "meshes/door_lr_primary_0_mesh.mesh"
                                    materials: [primary_material]
                                }
                                Model {
                                    id: door_lr_primary_002_0
                                    objectName: "door_lr_primary.002_0"
                                    source: "meshes/door_lr_primary_002_0_mesh.mesh"
                                    materials: [primary_002_material]
                                }
                                Node {
                                    id: door_lr_ok
                                    objectName: "door_lr_ok"
                                    Model {
                                        id: door_lr_ok_primary_0
                                        objectName: "door_lr_ok_primary_0"
                                        source: "meshes/door_lr_ok_primary_0_mesh.mesh"
                                        materials: [primary_material]
                                    }
                                }
                            }
                        }
                        Node {
                            id: door_rf_dummy
                            objectName: "door_rf_dummy"
                            position: Qt.vector3d(1.00579, 1.17528, -0.0625812)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: door_rf
                                objectName: "door_rf"
                                position: Qt.vector3d(-2.38419e-07,
                                                      -4.17233e-06, 6.93649e-06)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: door_rf_JUST_BLACK_0_0
                                    objectName: "door_rf_JUST_BLACK.0_0"
                                    source: "meshes/door_rf_JUST_BLACK_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_rf_texture_Buttons_0_0
                                    objectName: "door_rf_texture_Buttons.0_0"
                                    source: "meshes/door_rf_texture_Buttons_0_0_mesh.mesh"
                                    materials: [texture_Buttons_0_material]
                                }
                                Model {
                                    id: door_rf_movsteer_1_0_1_0
                                    objectName: "door_rf_movsteer_1.0.1_0"
                                    source: "meshes/door_rf_movsteer_1_0_1_0_mesh.mesh"
                                    materials: [movsteer_1_0_1_material]
                                }
                                Model {
                                    id: door_rf_movsteer_1_0_0_0
                                    objectName: "door_rf_movsteer_1.0.0_0"
                                    source: "meshes/door_rf_movsteer_1_0_0_0_mesh.mesh"
                                    materials: [movsteer_1_0_0_material]
                                }
                                Model {
                                    id: door_rf_Putih_0_0
                                    objectName: "door_rf_Putih.0_0"
                                    source: "meshes/door_rf_Putih_0_0_mesh.mesh"
                                    materials: [putih_0_material]
                                }
                                Model {
                                    id: door_rf_Plastic_0_0
                                    objectName: "door_rf_Plastic.0_0"
                                    source: "meshes/door_rf_Plastic_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_rf_aluminium2_0_0
                                    objectName: "door_rf_aluminium2.0_0"
                                    source: "meshes/door_rf_aluminium2_0_0_mesh.mesh"
                                    materials: [aluminium_light_0_material]
                                }
                                Model {
                                    id: door_rf_dvorright_0_0
                                    objectName: "door_rf_dvorright.0_0"
                                    source: "meshes/door_rf_dvorright_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_rf_door_lf_0_0
                                    objectName: "door_rf_door_lf.0_0"
                                    source: "meshes/door_rf_door_lf_0_0_mesh.mesh"
                                    materials: [door_lf_0_material]
                                }
                                Model {
                                    id: door_rf_glass_0_0
                                    objectName: "door_rf_glass.0_0"
                                    source: "meshes/door_rf_glass_0_0_mesh.mesh"
                                    materials: [glass_0_material]
                                }
                                Model {
                                    id: door_rf_mirror_inside_0_0
                                    objectName: "door_rf_mirror_inside.0_0"
                                    source: "meshes/door_rf_mirror_inside_0_0_mesh.mesh"
                                    materials: [mirror_inside_0_material]
                                }
                                Model {
                                    id: door_rf_primary_0
                                    objectName: "door_rf_primary_0"
                                    source: "meshes/door_rf_primary_0_mesh.mesh"
                                    materials: [primary_material]
                                }
                                Model {
                                    id: door_rf_primary_002_0
                                    objectName: "door_rf_primary.002_0"
                                    source: "meshes/door_rf_primary_002_0_mesh.mesh"
                                    materials: [primary_002_material]
                                }
                                Node {
                                    id: door_rf_ok
                                    objectName: "door_rf_ok"
                                    Model {
                                        id: door_rf_ok_primary_0
                                        objectName: "door_rf_ok_primary_0"
                                        source: "meshes/door_rf_ok_primary_0_mesh.mesh"
                                        materials: [primary_material]
                                    }
                                }
                            }
                        }
                        Node {
                            id: door_rr_dummy
                            objectName: "door_rr_dummy"
                            position: Qt.vector3d(1.03309, -0.13056, -0.0625833)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: door_rr
                                objectName: "door_rr"
                                position: Qt.vector3d(5.96046e-07, 5.21541e-07,
                                                      -5.58794e-07)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: door_rr_JUST_BLACK_0_0
                                    objectName: "door_rr_JUST_BLACK.0_0"
                                    source: "meshes/door_rr_JUST_BLACK_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_rr_texture_Buttons_0_0
                                    objectName: "door_rr_texture_Buttons.0_0"
                                    source: "meshes/door_rr_texture_Buttons_0_0_mesh.mesh"
                                    materials: [texture_Buttons_0_material]
                                }
                                Model {
                                    id: door_rr_movsteer_1_0_1_0
                                    objectName: "door_rr_movsteer_1.0.1_0"
                                    source: "meshes/door_rr_movsteer_1_0_1_0_mesh.mesh"
                                    materials: [movsteer_1_0_1_material]
                                }
                                Model {
                                    id: door_rr_movsteer_1_0_0_0
                                    objectName: "door_rr_movsteer_1.0.0_0"
                                    source: "meshes/door_rr_movsteer_1_0_0_0_mesh.mesh"
                                    materials: [movsteer_1_0_0_material]
                                }
                                Model {
                                    id: door_rr_Putih_0_0
                                    objectName: "door_rr_Putih.0_0"
                                    source: "meshes/door_rr_Putih_0_0_mesh.mesh"
                                    materials: [putih_0_material]
                                }
                                Model {
                                    id: door_rr_Plastic_0_0
                                    objectName: "door_rr_Plastic.0_0"
                                    source: "meshes/door_rr_Plastic_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_rr_aluminium2_0_0
                                    objectName: "door_rr_aluminium2.0_0"
                                    source: "meshes/door_rr_aluminium2_0_0_mesh.mesh"
                                    materials: [aluminium_light_0_material]
                                }
                                Model {
                                    id: door_rr_dvorright_0_0
                                    objectName: "door_rr_dvorright.0_0"
                                    source: "meshes/door_rr_dvorright_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Model {
                                    id: door_rr_glass_0_0
                                    objectName: "door_rr_glass.0_0"
                                    source: "meshes/door_rr_glass_0_0_mesh.mesh"
                                    materials: [glass_0_material]
                                }
                                Model {
                                    id: door_rr_primary_0
                                    objectName: "door_rr_primary_0"
                                    source: "meshes/door_rr_primary_0_mesh.mesh"
                                    materials: [primary_material]
                                }
                                Model {
                                    id: door_rr_primary_002_0
                                    objectName: "door_rr_primary.002_0"
                                    source: "meshes/door_rr_primary_002_0_mesh.mesh"
                                    materials: [primary_002_material]
                                }
                                Node {
                                    id: door_rr_ok
                                    objectName: "door_rr_ok"
                                    position: Qt.vector3d(0, 0, 0.000274837)
                                    Model {
                                        id: door_rr_ok_primary_002_0
                                        objectName: "door_rr_ok_primary.002_0"
                                        source: "meshes/door_rr_ok_primary_002_0_mesh.mesh"
                                        materials: [primary_002_material]
                                    }
                                }
                            }
                        }
                        Node {
                            id: windscreen_dummy
                            objectName: "windscreen_dummy"
                            position: Qt.vector3d(0, 0.729028, 0.572526)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: windscreen_ok
                                objectName: "windscreen_ok"
                                position: Qt.vector3d(0, 1.2517e-06,
                                                      -1.78814e-06)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: windscreen_ok_glass_0_0
                                    objectName: "windscreen_ok_glass.0_0"
                                    source: "meshes/windscreen_ok_glass_0_0_mesh.mesh"
                                    materials: [glass_0_material]
                                }
                            }
                        }
                        Node {
                            id: bump_front_dummy
                            objectName: "bump_front_dummy"
                            position: Qt.vector3d(0.87334, 1.93141, 0.128491)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: front_black
                                objectName: "front_black"
                                position: Qt.vector3d(4.73857e-05,
                                                      -1.19209e-07,
                                                      -1.93715e-07)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: front_black_front_black_0_0
                                    objectName: "front_black_front_black.0_0"
                                    source: "meshes/front_black_front_black_0_0_mesh.mesh"
                                    materials: [dvorright_0_material]
                                }
                                Node {
                                    id: chrome_002
                                    objectName: "chrome.002"
                                    Model {
                                        id: chrome_002_back_chrome_light_0_0
                                        objectName: "chrome.002_back_chrome_light.0_0"
                                        source: "meshes/chrome_002_back_chrome_light_0_0_mesh.mesh"
                                        materials: [back_chrome_light_0_material]
                                    }
                                }
                                Node {
                                    id: foglights_r
                                    objectName: "foglights_r"
                                    Model {
                                        id: foglights_r_foglight_r_0
                                        objectName: "foglights_r_foglight r_0"
                                        source: "meshes/foglights_r_foglight_r_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: foglights_l
                                    objectName: "foglights_l"
                                    Model {
                                        id: foglights_l_foglight_l_0
                                        objectName: "foglights_l_foglight l_0"
                                        source: "meshes/foglights_l_foglight_l_0_mesh.mesh"
                                        materials: [breaklight_l_material]
                                    }
                                }
                                Node {
                                    id: indicator_lights_r
                                    objectName: "indicator_lights_r"
                                    Model {
                                        id: indicator_lights_r_indicator_rf_0
                                        objectName: "indicator_lights_r_indicator rf_0"
                                        source: "meshes/indicator_lights_r_indicator_rf_0_mesh.mesh"
                                        materials: [right_rear_light_material]
                                    }
                                }
                                Node {
                                    id: indicator_lights_l
                                    objectName: "indicator_lights_l"
                                    Model {
                                        id: indicator_lights_l_indicator_lf_0
                                        objectName: "indicator_lights_l_indicator lf_0"
                                        source: "meshes/indicator_lights_l_indicator_lf_0_mesh.mesh"
                                        materials: [right_rear_light_material]
                                    }
                                }
                                Node {
                                    id: tembus_depan_ok
                                    objectName: "tembus_depan_ok"
                                    Model {
                                        id: tembus_depan_ok_tembus_red_0_0
                                        objectName: "tembus_depan_ok_tembus red.0_0"
                                        source: "meshes/tembus_depan_ok_tembus_red_0_0_mesh.mesh"
                                        materials: [tembus_red_0_material]
                                    }
                                }
                            }
                            Node {
                                id: front_bumper_ok
                                objectName: "front_bumper_ok"
                                position: Qt.vector3d(2.29478e-05, 1.0848e-05,
                                                      2.72244e-05)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: front_bumper_ok_primary_0
                                    objectName: "front_bumper_ok_primary_0"
                                    source: "meshes/front_bumper_ok_primary_0_mesh.mesh"
                                    materials: [primary_material]
                                }
                            }
                        }
                        Node {
                            id: bump_rear_dummy
                            objectName: "bump_rear_dummy"
                            position: Qt.vector3d(0.87334, -1.92876, 0.281369)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: rear_bumper
                                objectName: "rear_bumper"
                                position: Qt.vector3d(-2.14577e-06,
                                                      -5.96046e-07, 1.51992e-05)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: rear_bumper_movsteer_1_0_1_0
                                    objectName: "rear_bumper_movsteer_1.0.1_0"
                                    source: "meshes/rear_bumper_movsteer_1_0_1_0_mesh.mesh"
                                    materials: [movsteer_1_0_1_material]
                                }
                                Node {
                                    id: rear_bumper_ok
                                    objectName: "rear_bumper_ok"
                                    position: Qt.vector3d(2.77162e-05,
                                                          1.38283e-05,
                                                          -1.508e-05)
                                    Model {
                                        id: rear_bumper_ok_primary_0
                                        objectName: "rear_bumper_ok_primary_0"
                                        source: "meshes/rear_bumper_ok_primary_0_mesh.mesh"
                                        materials: [primary_material]
                                    }
                                }
                                Node {
                                    id: light_pantulan
                                    objectName: "light_pantulan"
                                    Model {
                                        id: light_pantulan_light_pantulan_0_0
                                        objectName: "light_pantulan_light_pantulan.0_0"
                                        source: "meshes/light_pantulan_light_pantulan_0_0_mesh.mesh"
                                        materials: [light_pantulan_0_material]
                                    }
                                }
                                Node {
                                    id: tembus_belakang
                                    objectName: "tembus_belakang"
                                    Model {
                                        id: tembus_belakang_tembus_red_0_0
                                        objectName: "tembus_belakang_tembus red.0_0"
                                        source: "meshes/tembus_belakang_tembus_red_0_0_mesh.mesh"
                                        materials: [tembus_red_0_material]
                                    }
                                }
                            }
                        }
                        Node {
                            id: bonnet_dummy
                            objectName: "bonnet_dummy"
                            position: Qt.vector3d(0, 1.32639, 0.237391)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Node {
                                id: bonnet_ok
                                objectName: "bonnet_ok"
                                position: Qt.vector3d(0, -9.53674e-07,
                                                      1.0103e-05)
                                rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                                Model {
                                    id: bonnet_ok_primary_0
                                    objectName: "bonnet_ok_primary_0"
                                    source: "meshes/bonnet_ok_primary_0_mesh.mesh"
                                    materials: [primary_material]
                                }
                                Node {
                                    id: chrome_bonnet_ok
                                    objectName: "chrome_bonnet_ok"
                                    position: Qt.vector3d(0, -4.76837e-07,
                                                          -2.38419e-07)
                                    Model {
                                        id: chrome_bonnet_ok_movsteer_1_0_1_0
                                        objectName: "chrome_bonnet_ok_movsteer_1.0.1_0"
                                        source: "meshes/chrome_bonnet_ok_movsteer_1_0_1_0_mesh.mesh"
                                        materials: [movsteer_1_0_1_material]
                                    }
                                }
                            }
                        }
                    }
                    Node {
                        id: wheel_rf_dummy
                        objectName: "wheel_rf_dummy"
                        position: Qt.vector3d(0.925074, 1.75662, -0.37177)
                        rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                        Node {
                            id: wheels
                            objectName: "wheels"
                            position: Qt.vector3d(-7.22408e-05, 3.61204e-05,
                                                  2.49147e-05)
                            rotation: Qt.quaternion(1, -1.32349e-23, 0, 0)
                            Model {
                                id: wheels_wheels_2_0
                                objectName: "wheels_wheels.2_0"
                                source: "meshes/wheels_wheels_2_0_mesh.mesh"
                                materials: [wheels_2_material]
                            }
                            Model {
                                id: wheels_wheels_0_0
                                objectName: "wheels_wheels.0_0"
                                source: "meshes/wheels_wheels_0_0_mesh.mesh"
                                materials: [wheels_0_material]
                            }
                            Model {
                                id: wheels_wheels_1_0
                                objectName: "wheels_wheels.1_0"
                                source: "meshes/wheels_wheels_1_0_mesh.mesh"
                                materials: [dvorright_0_material]
                            }
                            Model {
                                id: wheels_movsteer_1_0_1_0
                                objectName: "wheels_movsteer_1.0.1_0"
                                source: "meshes/wheels_movsteer_1_0_1_0_mesh.mesh"
                                materials: [movsteer_1_0_1_material]
                            }
                            Model {
                                id: wheels_wheels_3_0
                                objectName: "wheels_wheels.3_0"
                                source: "meshes/wheels_wheels_3_0_mesh.mesh"
                                materials: [wheels_3_material]
                            }
                            Model {
                                id: wheels_wheels_4_0
                                objectName: "wheels_wheels.4_0"
                                source: "meshes/wheels_wheels_4_0_mesh.mesh"
                                materials: [wheels_4_material]
                            }
                            Model {
                                id: wheels_wheels_6_0
                                objectName: "wheels_wheels.6_0"
                                source: "meshes/wheels_wheels_6_0_mesh.mesh"
                                materials: [wheels_6_material]
                            }
                        }
                        Node {
                            id: wheels_001
                            objectName: "wheels.001"
                            position: Qt.vector3d(-7.22408e-05, -3.20398,
                                                  2.49147e-05)
                            rotation: Qt.quaternion(1, -1.3e-23, 0, 0)
                            scale: Qt.vector3d(1.01807, 1.01807, 1.01807)
                            Model {
                                id: wheels_001_wheels_2_0
                                objectName: "wheels.001_wheels.2_0"
                                source: "meshes/wheels_001_wheels_2_0_mesh.mesh"
                                materials: [wheels_2_material]
                            }
                            Model {
                                id: wheels_001_wheels_0_0
                                objectName: "wheels.001_wheels.0_0"
                                source: "meshes/wheels_001_wheels_0_0_mesh.mesh"
                                materials: [wheels_0_material]
                            }
                            Model {
                                id: wheels_001_wheels_1_0
                                objectName: "wheels.001_wheels.1_0"
                                source: "meshes/wheels_001_wheels_1_0_mesh.mesh"
                                materials: [dvorright_0_material]
                            }
                            Model {
                                id: wheels_001_movsteer_1_0_1_0
                                objectName: "wheels.001_movsteer_1.0.1_0"
                                source: "meshes/wheels_001_movsteer_1_0_1_0_mesh.mesh"
                                materials: [movsteer_1_0_1_material]
                            }
                            Model {
                                id: wheels_001_wheels_3_0
                                objectName: "wheels.001_wheels.3_0"
                                source: "meshes/wheels_001_wheels_3_0_mesh.mesh"
                                materials: [wheels_3_material]
                            }
                            Model {
                                id: wheels_001_wheels_4_0
                                objectName: "wheels.001_wheels.4_0"
                                source: "meshes/wheels_001_wheels_4_0_mesh.mesh"
                                materials: [wheels_4_material]
                            }
                            Model {
                                id: wheels_001_wheels_6_0
                                objectName: "wheels.001_wheels.6_0"
                                source: "meshes/wheels_001_wheels_6_0_mesh.mesh"
                                materials: [wheels_6_material]
                            }
                        }
                    }
                }
            }
        }
    }

    // Animations:
}
