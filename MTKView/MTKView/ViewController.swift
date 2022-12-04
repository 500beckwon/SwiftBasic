//
//  ViewController.swift
//  MTKView
//
//  Created by ByungHoon Ann on 2022/12/03.
//

import UIKit
import MetalKit

class ViewController: UIViewController {
    var mtkView = MTKView()
    
    var metalCommandQueue : MTLCommandQueue!
    var metalLayer = CAMetalLayer()
    var ciContext : CIContext!
    var filteredImage: CIImage?
    var cleanImage: CIImage?
    
    let vertexData: [Float] = [
       0.0,  1.0, 0.0,
      -1.0, -1.0, 0.0,
       1.0, -1.0, 0.0
    ]
    
    var vertexBuffer: MTLBuffer!
    var pipelineState: MTLRenderPipelineState!
    var timer: CADisplayLink!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mtkView )
        mtkView.frame = view.bounds
        mtkView.device = MTLCreateSystemDefaultDevice()
        mtkView.enableSetNeedsDisplay = true
        mtkView.delegate = self
        mtkView.isPaused = true
        mtkView.enableSetNeedsDisplay = false
        mtkView.framebufferOnly = false
        mtkView.clearColor = MTLClearColorMake(0, 0.5, 0.5, 1.0)
        
        metalLayer.device = mtkView.device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
        
        let dataSize = vertexData.count * MemoryLayout.size(ofValue: vertexData[0]) // 1
        vertexBuffer = mtkView.device?.makeBuffer(bytes: vertexData, length: dataSize, options: []) // 2
        let defaultLibrary = mtkView.device!.makeDefaultLibrary()!
        let fragmentProgram = defaultLibrary.makeFunction(name: "basic_fragment")
        let vertexProgram = defaultLibrary.makeFunction(name: "basic_vertex")
            
        // 2
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
            
        // 3
        pipelineState = try! mtkView.device!.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        timer = CADisplayLink(target: self, selector: #selector(gameloop))
        timer.add(to: RunLoop.main, forMode: .default)
        metalCommandQueue = mtkView.device?.makeCommandQueue()
        ciContext = CIContext(mtlCommandQueue: metalCommandQueue)
        mtkView.draw()
        
        // Do any additional setup after loading the view.
        guard let commandBuffer = metalCommandQueue.makeCommandBuffer() else {
            
          return
          }
          
        //grab the filtered or a clean image to display
        guard let ciImage = filteredImage ?? cleanImage else {
          return
          }
        
        //get a drawable if the GPU is not busy
        guard let currentDrawable = mtkView.currentDrawable else {
          return
          }
        
        //make sure frame is centered on screen
        let heightOfImage = ciImage.extent.height
        let heightOfDrawable = mtkView.drawableSize.height
        let yOffset = (heightOfDrawable - heightOfImage)/2

        //render into the metal texture
        self.ciContext.render(ciImage,
                     to: currentDrawable.texture,
          commandBuffer: commandBuffer,
                 bounds: CGRect(origin: CGPoint(x: 0, y: -yOffset),
                                  size: mtkView.drawableSize),
             colorSpace: CGColorSpaceCreateDeviceRGB())

        //present the drawable and buffer
        commandBuffer.present(currentDrawable)

        //send the commands to the GPU
        commandBuffer.commit()
        
        let destination = CIRenderDestination(mtlTexture: currentDrawable.texture,
                                           commandBuffer: commandBuffer)
        do {
         try self.ciContext.startTask(toRender: ciImage, to: destination)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func renders() {
      // TODO
        guard let drawable = metalLayer.nextDrawable() else { return }
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(
          red: 0.0,
          green: 104.0/255.0,
          blue: 55.0/255.0,
          alpha: 1.0)
        let commandBuffer = metalCommandQueue.makeCommandBuffer()!
        let renderEncoder = commandBuffer
          .makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderEncoder
          .drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
        renderEncoder.endEncoding()
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }

    @objc func gameloop() {
      autoreleasepool {
        self.renders()
      }
    }
}

extension ViewController: MTKViewDelegate {
    func draw(in view: MTKView) {
        
        //render()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    private func render() {
            guard let renderPassDescriptor = mtkView.currentRenderPassDescriptor else { return }
            guard let commandBuffer = metalCommandQueue.makeCommandBuffer() else { return }
            guard let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else { return }
            guard let currentDrawable = mtkView.currentDrawable else { return }

            // encode some drawing commands..
            // but this sample do nothing
            commandEncoder.endEncoding()
            
            commandBuffer.present(currentDrawable)
            
            commandBuffer.commit()
        }
    
}

