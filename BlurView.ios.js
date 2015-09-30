'use strict'

var React = require('react-native')
var PropTypes = require('ReactPropTypes')
var ReactNativeViewAttributes = require('ReactNativeViewAttributes')
var createReactNativeComponentClass = require('createReactNativeComponentClass')

var NativeMethodsMixin = require('NativeMethodsMixin')
var merge = require('merge')
var { View, requireNativeComponent, PropTypes, NativeModules } = React

var BLUR_REF = "BLUR"

var BlurView = React.createClass({

  propTypes: {
    blurType: PropTypes.string,
  },

  getDefaultProps() {
    return {
      blurType: "light",
    }
  },

  setNativeProps(props) {
    this.refs[BLUR_REF].setNativeProps(props)
  },

  render() {
    var nativeProps = merge({},this.props, {
      style: this.props.style,
    })
    return (
        <RNBlurView
          ref={BLUR_REF}
           {... nativeProps}
          blurType={this.props.blurType}/>
    )
  }
})

var RNBlurView = requireNativeComponent('RNBlurView', Blur)

module.exports = BlurView
