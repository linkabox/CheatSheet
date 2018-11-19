### GPU instancing

#### 使用限制
- Unity会自动选取<MeshRenderer>组件和调用Graphics.DrawMesh使用GPU instancing技术。需要注意的是<SkinnedMeshRenderer>组件是不支持的
- Unity只会批处理使用相同网格和材质的GameObject，使用较小数量的网格与材质对实例化操作更加有效。如果想实例存在一定差异，那就需要修改Shader加入per-instance属性字段来实现。

你也可以直接使用`Graphics.DrawMeshInstanced`和`Graphics.DrawMeshInstancedIndirect`接口来实现GPU Instancing操作

#### 注意事项
- 当使用多个per-instance属性字段时，你无需全部都填充到`MaterialPropertyBlocks`中去
- 当一个实例缺少属性字段，Unity会先从引用的材质中读取，如果材质没有默认值，该值将设置为0。特别需要注意的是不要将非实例化属性设置到`MaterialPropertyBlocks`中去，因为这会导致实例化操作失效，取而代之的是创建不同的材质赋予Renderer
- 批处理优先级: Static > GPU instancing > Dynamic
- 从Unity 2017.3之后，在OpenGL平台你需要手动WarmUp来保证Shader能正确执行
- 编写Shader时最好都使用`UnityObjectToClipPos(v.vertex)`来替代`mul(UNITY_MATRIX_MVP,v.vertex)`