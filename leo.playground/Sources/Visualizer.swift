import Foundation
import CoreGraphics
import AppKit
public func createARGBBitmapContext(pixelsWide: Int, pixelsHigh: Int) -> CGContext {
    
    // Declare the number of bytes per row. Each pixel in the bitmap
    // in this example is represented by 4 bytes; 8 bits each of red,
    // green, blue, and alpha.
    let bitmapBytesPerRow = pixelsWide * 4
    let bitmapByteCount = bitmapBytesPerRow * pixelsHigh
    
    // Use the generic RGB color space.
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    // Allocate memory for image data. This is the destination in
    // memory where any drawing to the bitmap context will be rendered.
    let bitmapData = malloc(bitmapByteCount)
    let bitmapInfo = CGBitmapInfo(rawValue:CGImageAlphaInfo.premultipliedFirst.rawValue)
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the
    // format  specified here by CGBitmapContextCreate.
    let context = CGContext(data: bitmapData, width: pixelsWide,
                            height: pixelsHigh, bitsPerComponent: 8, bytesPerRow: bitmapBytesPerRow,
                            space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
    return context!
}

public func colorOfPixel(context: CGContext, x: Int, y: Int) -> NSColor {
    // Now we can get a pointer to the image data associated with the bitmap context.
    let data = context.data!
    let opaque = OpaquePointer(data)
    let dataType = UnsafePointer<UInt8>(opaque)
    let offset = 4*((context.width * y) + x)
    
    let alphaValue = dataType[offset]
    let redColor   = dataType[offset+1]
    let greenColor = dataType[offset+2]
    let blueColor  = dataType[offset+3]
    
    let redFloat   = CGFloat(redColor)   / 255.0
    let greenFloat = CGFloat(greenColor) / 255.0
    let blueFloat  = CGFloat(blueColor)  / 255.0
    let alphaFloat = CGFloat(alphaValue) / 255.0
    return NSColor(red: redFloat, green: greenFloat, blue: blueFloat, alpha: alphaFloat)
}

public func setColorOfPixel(context: CGContext, x: Int, y: Int, red: UInt8, green: UInt8, blue: UInt8) {
    let data = context.data!
    let opaque = OpaquePointer(data)
    let dataType = UnsafeMutablePointer<UInt8>(opaque)
    
    let offset = 4*((context.width * y) + x)
    
    dataType[offset]   = 255
    dataType[offset+1] = red
    dataType[offset+2] = green
    dataType[offset+3] = blue
}
