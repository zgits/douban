
function rem(e) {
    var t = $("<div />");
    t.css({
        position: "absolute",
        left: -9999,
        top: e + "rem"
    }),
        t.appendTo("body");
    var n = t.position().top;
    return t.remove(),
        n
}

function isSmallDevice() {
    return $(window).width() < 1200
}

function Display(e) {
    var t = this;
    t.canvas = e,
        t.context = void 0,
        t.framerate = 30,
        t.numFrames = 0,
        t.paused = !0,
        t.nextRedraw = 0,
        t.scale = 1,
        t.listeners = {},
        t.draw = {
            continuous: !1,
            info: !1
        },
        t.info = {
            fps: 0,
            lastFrameTime: 0,
            runningFrameTime: 0
        },
        t.frames_for_menu_to_ramin_visible = 3 * t.framerate,
        t.triggered_initial_mouseover = !1,
        t.logo = {},
        t.init = function () {
            return t.canvas.getContext ? (t.context = t.canvas.getContext("2d"), t.context.scale(t.scale, t.scale), t.calculate_scale(), t.canvas.onmousedown = function (e) {
                return t.fireEvent("mouseDown", e),
                    !1
            },
                t.canvas.onmouseup = function (e) {
                    return t.fireEvent("mouseUp", e),
                        !1
                },
                t.canvas.onmouseover = function (e) {
                    t.fireEvent("mouseOver", e)
                },
                t.canvas.onmousemove = function (e) {
                    t.fireEvent("mouseMove", e)
                },
                window.requestAnimFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame, t.addListener("draw", t), t.addListener("afterDraw", t), t.addListener("newFrame", t), t.main(), void t.setupStats()) : void t.error("No Context")
        },
        t.calculate_scale = function () {
            t.width = t.canvas.width / t.scale,
                t.height = t.canvas.height / t.scale
        },
        t.addListener = function (e, n) {
            t.listeners[e] || (t.listeners[e] = []),
                t.listeners[e].push(n)
        },
        t.fireEvent = function (e, n) {
            if (t.listeners[e] && t.listeners[e].length > 0) for (var i = "on" + e.substr(0, 1).toUpperCase() + e.substr(1), o = 0; o < t.listeners[e].length; o++) t.listeners[e][o][i] && t.listeners[e][o][i].call(t.listeners[e][o], n, t)
        },
        t.main = function () {
            t.paused || t.nextFrame(),
                window.requestAnimFrame ? window.requestAnimFrame(function () {
                    t.main()
                }) : t.nextRedraw = setTimeout(function () {
                        t.main()
                    },
                    1e3 / t.framerate)
        },
        t.nextFrame = function () {
            t.fireEvent("newFrame"),
                t.fireEvent("beforeUpdate"),
                t.fireEvent("update"),
                t.fireEvent("afterUpdate"),
                t.fireEvent("beforeDraw"),
                t.fireEvent("draw"),
                t.fireEvent("afterDraw")
        },
        t.error = function (e) {
            t.fireEvent("error", {
                text: e
            })
        },
        t.getFps = function () {
            return (1e3 / t.info.runningFrameTime).toFixed(1)
        },
        t.onDraw = function () {
            t.tick()
        },
        t.onAfterDraw = function () {
            t.draw.info && this.stats.end()
        },
        t.drawStats = function () {
        },
        t.onNewFrame = function () {
            if (t.draw.info && this.stats.begin(), t.numFrames > t.frames_for_menu_to_ramin_visible && !t.triggered_initial_mouseover) {
                var e = $.Event("mousemove");
                t.canvas.onmousemove(e),
                    t.triggered_initial_mouseover = !0
            }
            t.draw.continuous || t.clear()
        },
        t.drawLine = function (e, n) {
            t.context.beginPath(),
                t.context.moveTo(e.x, e.y),
                t.context.lineTo(n.x, n.y),
                t.context.stroke()
        },
        t.drawText = function (e, n, i) {
            t.context.fillText(e, n.x, n.y, i)
        },
        t.drawCircle = function (e, n) {
            t.context.beginPath(),
                t.context.arc(e.x, e.y, n, 0, 2 * Math.PI),
                t.context.closePath(),
                t.context.fill()
        },
        t.fillStyle = function (e) {
            t.context.fillStyle = e
        },
        t.strokeStyle = function (e) {
            t.context.strokeStyle = e
        },
        t.tick = function () {
            if (t.numFrames++, t.info.lastFrameTime) {
                var e = (new Date).getTime(),
                    n = e - t.info.lastFrameTime;
                t.info.runningFrameTime = .8 * t.info.runningFrameTime + .2 * n,
                    t.info.lastFrameTime = e
            } else t.info.lastFrameTime = (new Date).getTime()
        },
        t.setupStats = function () {
            return t.draw.info ? (this.stats = new Stats, this.stats.domElement.style.position = "absolute", this.stats.domElement.style.bottom = "0px", this.stats.domElement.style.right = "0px", void document.body.appendChild(this.stats.domElement)) : !1
        },
        t.clear = function () {
            t.context.clearRect(0, 0, t.width, t.height)
        },
        t.start = function () {
            t.paused = !1
        },
        t.stop = function () {
            t.paused = !0
        },
        t.togglePause = function () {
            t.paused = !t.paused
        },
        t.unpause = t.start,
        t.pause = t.stop,
        t.step = function () {
            t.stop(),
                t.nextFrame()
        },
        t.drawConsensysLogo = function () {
            var e = t.canvas.width / 2 - t.consensys_logo.width / 2,
                n = t.canvas.height / 2 - t.consensys_logo.height / 2;
            t.context.drawImage(t.consensys_logo, e, n, 150, 150)
        }
}

function Particle(e, t) {
    this.position = e,
        this.velocity = t,
        this.acceleration = new Vector(0, 0),
        this.ttl = -1,
        this.lived = 0,
        this.isFixed = 0,
        this.fillStyle = "white",  //闄堝織鍚�
        this.radius = 1 + 2 * Math.random(),
        this.connects = 0,
    this.radius >= 2.5 && (this.connects = 1),
    this.radius < 2.5 && (this.fillStyle = "#abd1ff", this.ttl = 1),
        this.radius = 2
}

function ParticleEmitter(e, t) {
    this.position = e,
        this.velocity = t,
        this.size = 8,
        this.particleLife = -1,
        this.spread = .3,
        this.emissionRate = .08,
        this.moveTo = function (e) {
            this.position = e
        },
        this.addParticle = function () {
            var e = new Particle(this.position.copy(), Vector.fromAngle(this.velocity.getAngle() + this.spread - Math.random() * this.spread * 2, this.velocity.getMagnitude()));
            return e
        },
        this.toString = function () {
            var e = [this.position.toString(), this.velocity.toString(), this.size, this.particleLife, this.spread.toFixed(2), this.emissionRate];
            return "E" + e.join(":")
        }
}

function ParticleSystem() {
    var e = this;
    e.display = null,
        e.maxParticles = 400,
        e.startTime = 0,
        e.draw = {
            objects: !1,
            accelerations: !1,
            velocities: !1,
            particles: !0
        },
        e.particles = [],
        e.emitters = [],
        e.fields = [],
        e.listeners = {},
        e.elapsed = 0,
        e.lastEmitter = 0,
        e.mouseCoords = new Point(0, 0),
        e.mouseFieldStrength = -140,
        e.mouseField,
        e.lines = {
            enabled: !0,
            min_particle_life: 0
        },
        e.minDist = 60,
        e.thresholdDist = 0,
        e.maxLines = 20,
        e.bounds_threshold = 30,
        e.buttons = null,
        e.menu_particles = [],
        e.init = function (t) {
            return e.display = t,
                t.addListener("draw", e),
                t.addListener("afterDraw", e),
                t.addListener("beforeUpdate", e),
                t.addListener("update", e),
                t.addListener("mouseUp", e),
                t.addListener("mouseDown", e),
                t.addListener("mouseMove", e),
                e
        },
        e.addListener = function (t, n) {
            e.listeners[t] || (e.listeners[t] = []),
                e.listeners[t].push(n)
        },
        e.fireEvent = function (t, n) {
            if (e.listeners[t] && e.listeners[t].length > 0) for (var i = "on" + t.substr(0, 1).toUpperCase() + t.substr(1), o = 0; o < e.listeners[t].length; o++) e.listeners[t][o][i] && e.listeners[t][o][i].call(e.listeners[t][o], n, e)
        },
        e.addEmitter = function (t, n) {
            var i = new ParticleEmitter(t, n);
            e.emitters.push(i),
                e.fireEvent("newObject", {
                    particleTarget: i
                })
        },
        e.removeEmitter = function (t) {
            typeof t.constructor !== Number && (t = e.emitters.indexOf(t));
            var n = e.emitters.splice(t, 1);
            n && e.fireEvent("deleteObject", {
                particleTarget: n
            })
        },
        e.addField = function (t, n) {
            var i = new Field(t, n);
            e.fields.push(i),
                e.fireEvent("newObject", {
                    particleTarget: i
                })
        },
        e.removeField = function (t) {
            typeof t.constructor !== Number && (t = e.fields.indexOf(t));
            var n = e.fields.splice(t, 1);
            n && e.fireEvent("deleteObject", {
                particleTarget: n
            })
        },
        e.onBeforeUpdate = function (t, n) {
            e.draw.accelerations && e.drawAccelerations(n),
            e.draw.velocities && e.drawVelocities(n)
        },
        e.onUpdate = function (t, n) {
            e.elapsed++,
                e.addNewParticles(),
                e.plotParticles(n)
        },
        e.onDraw = function (t, n) {
            e.draw.particles && e.drawParticles(n),
            e.draw.objects && (e.drawFields(n), e.drawEmitters(n))
        },
        e.onAfterDraw = function (e, t) {
            t.draw.info
        },
        e.onMouseDown = function (t) {
            var n = e.getObjectAtPoint(e.mouseCoords);
            e.selected && (t.particleTarget = e.selected, e.fireEvent("objectBlur", t), e.selected = void 0),
                n ? (e.clicked = n, t.particleTarget = n, e.fireEvent("objectMouseDown")) : (e.mouseField = new Field(e.mouseCoords, e.mouseFieldStrength), e.mouseField.size = 0, e.fields.push(e.mouseField))
        },
        e.onMouseUp = function (t) {
            var n = e.getObjectAtPoint(e.mouseCoords);
            e.mouseField ? (e.removeField(e.mouseField), e.mouseField = void 0) : e.clicked && (t.particleTarget = e.clicked, n === e.clicked && (e.clicked.moved ? e.fireEvent("objectFinishMove", t) : (e.selected = e.clicked, e.fireEvent("objectClick", t), e.fireEvent("objectFocus", t)), delete e.clicked.moved, e.clicked = void 0))
        },
        e.onMouseMove = function (t, n) {
            if (e.mouseCoords = new Point(t.offsetX || t.layerX - n.canvas.offsetLeft, t.offsetY || t.layerY - n.canvas.offsetTop), e.mouseField) e.mouseField.moveTo(e.mouseCoords);
            else if (e.clicked) e.clicked.moved = !0,
                e.clicked.moveTo(e.mouseCoords);
            else {
                var i = e.getObjectAtPoint(e.mouseCoords);
                e.objectMouseOver !== i && (e.objectMouseOver ? (t.particleTarget = e.objectMouseOver, e.fireEvent("objectMouseOut", t), e.objectMouseOver = void 0) : (t.particleTarget = i, e.fireEvent("objectMouseIn", t), e.objectMouseOver = i))
            }
        },
        e.addNewParticles = function () {
            if (e.particles.length < e.maxParticles) for (var t, n = 0; t = e.emitters[n]; n++) {
                var i = t.emissionRate;
                if (1 > i) {
                    if (!(e.display.numFrames % 10 <= 10 * i)) continue;
                    i = 1
                }
                for (var o = 0; i > o; o++) e.particles.push(t.addParticle())
            }
        },
        e.plotParticles = function (t) {
            for (var n, i = e.bounds_threshold,
                     o = t.width + i,
                     r = t.height + i,
                     a = e.particles,
                     s = e.fields,
                     l = []; n = a.pop();) {
                if (n.ttl > 0) {
                    if (++n.lived >= n.ttl) continue
                } else n.lived++;
                n.isFixed || (n.submitToFields(s), n.move());
                var c = n.position,
                    u = ({
                        x: t.canvas.width / t.scale / 2,
                        y: t.canvas.height / t.scale / 2
                    },
                        {
                            top: t.logo.position.top + t.logo.height / 2,
                            left: t.logo.position.left + t.logo.width / 2
                        }),
                    d = (t.logo.width - 10) / 2,
                    p = Math.pow(c.x - u.left, 2) + Math.pow(c.y - u.top, 2),
                    f = t.canvas.width / t.scale / 2;
                if (f * f >= p) {
                    var h = p / (f * f);
                    n.radius = 2 - 1 * (1 - h)
                }
                var m = Math.pow(c.x - u.left, 2) + Math.pow(c.y - u.top, 2) <= d * d;
                m || c.x < -i || c.x > o || c.y < -i || c.y > r || l.push(n)
            }
            if (e.particles = l, !e.lines.enabled) return !0;
            for (var g = 0; g < e.particles.length; g++) if (c = e.particles[g], c.connects && !(c.lived < e.lines.min_particle_life)) for (var v = 0,
                                                                                                                                                y = g + 1; y < e.particles.length && (p2 = e.particles[y], !p2.connects || p2.lived < e.lines.min_particle_life || (v += e.distance(t, c, p2), !(v >= e.maxLines))); y++) ;
        },
        e.distance = function (t, n, i) {
            if (n.menu_particle && i.menu_particle) return 0;
            var o, r = n.position.x - i.position.x,
                a = n.position.y - i.position.y,
                s = t.context;
            if (o = Math.sqrt(r * r + a * a), o <= e.minDist && o > e.thresholdDist) {
                s.beginPath();
                var l = 1.2 - o / e.minDist;
                return (n.anchor_particle && i.menu_particle || i.anchor_particle && n.menu_particle) && (l = 1),
                    s.strokeStyle = "rgba(255,255,255," + l + ")", //闄堝織鍚�
                    s.moveTo(n.position.x, n.position.y),
                    s.lineTo(i.position.x, i.position.y),
                    s.stroke(),
                    s.closePath(),
                    1
            }
            return 0
        },
        e.drawParticles = function (t) {
            for (var n, i = -1; n = e.particles[++i];) n.draw(t)
        },
        e.drawAccelerations = function (t) {
            t.strokeStyle("white"),
                t.context.beginPath();
            for (var n = 0,
                     i = e.particles.length; i > n; n++) {
                var o = e.particles[n];
                t.context.moveTo(o.position.x, o.position.y),
                    t.context.lineTo(o.position.x + o.acceleration.x, o.position.y + o.acceleration.y)
            }
            t.context.stroke()
        },
        e.drawVelocities = function (t) {
            t.strokeStyle("blue"),
                t.context.beginPath();
            for (var n = 0,
                     i = e.particles.length; i > n; n++) {
                var o = e.particles[n];
                t.context.moveTo(o.position.x, o.position.y),
                    t.context.lineTo(o.position.x + o.velocity.x, o.position.y + o.velocity.y)
            }
            t.context.stroke()
        },
        e.drawFields = function (t) {
            for (var n = 0,
                     i = e.fields.length; i > n; n++) e.drawCircularObject(t, e.fields[n])
        },
        e.drawEmitters = function (t) {
            for (var n = 0,
                     i = e.emitters.length; i > n; n++) e.drawCircularObject(t, e.emitters[n])
        },
        e.drawCircularObject = function (e, t) {
            var n = t.size >> 1,
                i = e.context.createLinearGradient(t.position.x - n, t.position.y - n, t.position.x + n, t.position.y + n);
            i.addColorStop(0, t.drawColor || t.constructor.drawColor),
                i.addColorStop(1, t.drawColor2 || t.constructor.drawColor2),
                e.fillStyle(i),
                e.drawCircle(t.position, n)
        },
        e.getObjectAtPoint = function (t) {
            for (var n = 0; n < e.emitters.length; n++) {
                var i = e.emitters[n];
                if (t.withinBounds(i.position, i.size)) return i
            }
            for (var n = 0; n < e.fields.length; n++) {
                var o = e.fields[n];
                if (t.withinBounds(o.position, o.size)) return o
            }
        },
        e.initMenuParticles = function () {
            var t = {
                    x: e.display.canvas.width / 2,
                    y: e.display.canvas.height / 2
                },
                n = 160,
                i = new Particle(new Point(t.x, t.y - n), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "VISION",
                e.particles.push(i),
                e.menu_particles.push(i);
            var i = new Particle(new Point(t.x - n, t.y - n), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "BLOG",
                e.particles.push(i),
                e.menu_particles.push(i);
            var i = new Particle(new Point(t.x - n, t.y), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "MISSION",
                e.particles.push(i),
                e.menu_particles.push(i);
            var i = new Particle(new Point(t.x - n, t.y + n), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "COMPANY",
                e.particles.push(i),
                e.menu_particles.push(i);
            var i = new Particle(new Point(t.x, t.y + n), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "PROJECTS",
                e.particles.push(i),
                e.menu_particles.push(i);
            var i = new Particle(new Point(t.x + n, t.y + n), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "TEAM",
                e.particles.push(i),
                e.menu_particles.push(i);
            var i = new Particle(new Point(t.x + n, t.y), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "CONTACT",
                e.particles.push(i),
                e.menu_particles.push(i);
            var i = new Particle(new Point(t.x + n, t.y - n), new Vector(0, 0));
            i.setAsMenuAnchorType(),
                i.menu_name = "ETHEREUM",
                e.particles.push(i),
                e.menu_particles.push(i)
        },
        e.getParticleCount = function () {
            return e.particles.length
        },
        e.getEmitterCount = function () {
            return e.emitters.length
        },
        e.getFieldCount = function () {
            return e.fields.length
        },
        e.toString = function () {
            for (var t = 1,
                     n = [e.maxParticles, e.draw.objects ? 1 : 0, e.draw.accelerations ? 1 : 0, e.draw.velocities ? 1 : 0, e.draw.particles ? 1 : 0], i = 0; i < e.emitters.length; i++) n.push(e.emitters[i].toString());
            for (var i = 0; i < e.fields.length; i++) n.push(e.fields[i].toString());
            return "Sv" + t + "(" + n.join("|") + ")"
        },
        e.fromString = function (t) {
            var n = {
                    Sv1: e.loadStateV1
                },
                i = t.match(/^([^(]+)\((.*)\)$/);
            i && 3 == i.length && n[i[1]] && n[i[1]](i[2])
        },
        e.loadStateV1 = function (t) {
            var n = t.split("|");
            e.maxParticles = parseInt(n.shift()),
                e.draw.objects = "1" === n.shift() ? !0 : !1,
                e.draw.accelerations = "1" === n.shift() ? !0 : !1,
                e.draw.velocities = "1" === n.shift() ? !0 : !1,
                e.draw.particles = "1" === n.shift() ? !0 : !1,
                e.emitters = [],
                e.fields = [];
            for (; objectString = n.shift();) "E" == objectString.charAt(0) ? e.emitters.push(ParticleEmitter.fromString(objectString)) : e.fields.push(Field.fromString(objectString))
        }
}

function Field(e, t) {
    this.position = e,
        this.size = 8,
        this.setMass(t)
}

function Vector(e, t) {
    this.x = e || 0,
        this.y = t || 0
}

function addEmittersAndFields(e) {
    var t = e.display;
    t.logo.width = $("#blachole").width(),
        t.logo.height = $("#blachole").height(),
        t.logo.position = $("#blachole").position(),
        isSmallDevice() ? (e.maxParticles = Math.round($(window).width() / 5), e.maxParticles > 150 && (e.maxParticles = 150), e.addEmitter(new Point(rem(3.2), t.canvas.height / t.scale - rem(30.1)), new Vector(1, 0)), e.addEmitter(new Point(rem(3.2), t.canvas.height / t.scale - rem(22.1)), new Vector(1, 0)), e.addEmitter(new Point(rem(3.2), t.canvas.height / t.scale - rem(16.5)), new Vector(1, 0)), e.addEmitter(new Point(0, 0), new Vector(.5, 1)), e.addEmitter(new Point(rem(3), t.canvas.height / t.scale - rem(4)), new Vector(1, -.3))) : (e.maxParticles = 400, e.addEmitter(new Point(rem(10), rem(14)), new Vector(1, .5)), e.addEmitter(new Point(rem(49), rem(32)), new Vector(1, .5)), e.addEmitter(new Point(rem(9.5), rem(24)), new Vector(1, .5)), e.addEmitter(new Point(rem(9.5), rem(32)), new Vector(1, .5)), e.addEmitter(new Point(rem(10), rem(42)), new Vector(1, .5)), e.addEmitter(new Point(rem(29), rem(14)), new Vector(1, .5)), e.addEmitter(new Point(rem(10), t.canvas.height / t.scale - rem(10)), new Vector(1, -.1)));
    var n = 1 * Math.sqrt(t.canvas.width / t.scale / 2 * (t.canvas.width / t.scale / 2) + t.canvas.height / t.scale / 2 * (t.canvas.height / t.scale / 2)),
        i = {
            top: t.logo.position.top + t.logo.height / 2,
            left: t.logo.position.left + t.logo.width / 2
        };
    e.addField(new Point(i.left, i.top), 2 * n),
        isSmallDevice() ? (e.addField(new Point(t.canvas.width / t.scale - rem(2.4), t.canvas.height / t.scale - rem(2.4)), -n / 10), e.addField(new Point(t.canvas.width / t.scale, 2 * (t.canvas.height / t.scale) / 3), -n / 10)) : (e.addField(new Point(t.canvas.width / t.scale - rem(12), t.canvas.height / t.scale - rem(12)), -n / 10), e.addField(new Point(t.canvas.width / t.scale / 2, 120), n / 5))
}

void 0 === jQuery.migrateMute && (jQuery.migrateMute = !0),
    function (e, t, n) {
        function i(n) {
            var i = t.console;
            r[n] || (r[n] = !0, e.migrateWarnings.push(n), i && i.warn && !e.migrateMute && (i.warn("JQMIGRATE: " + n), e.migrateTrace && i.trace && i.trace()))
        }

        function o(t, o, r, a) {
            if (Object.defineProperty) try {
                return Object.defineProperty(t, o, {
                    configurable: !0,
                    enumerable: !0,
                    get: function () {
                        return i(a),
                            r
                    },
                    set: function (e) {
                        i(a),
                            r = e
                    }
                }),
                    n
            } catch (s) {
            }
            e._definePropertyBroken = !0,
                t[o] = r
        }

        var r = {};
        e.migrateWarnings = [],
        !e.migrateMute && t.console && t.console.log && t.console.log("JQMIGRATE: Logging is active"),
        e.migrateTrace === n && (e.migrateTrace = !0),
            e.migrateReset = function () {
                r = {},
                    e.migrateWarnings.length = 0
            },
        "BackCompat" === document.compatMode && i("jQuery is not compatible with Quirks Mode");
        var a = e("<input/>", {
                size: 1
            }).attr("size") && e.attrFn,
            s = e.attr,
            l = e.attrHooks.value && e.attrHooks.value.get ||
                function () {
                    return null
                },
            c = e.attrHooks.value && e.attrHooks.value.set ||
                function () {
                    return n
                },
            u = /^(?:input|button)$/i,
            d = /^[238]$/,
            p = /^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,
            f = /^(?:checked|selected)$/i;
        o(e, "attrFn", a || {},
            "jQuery.attrFn is deprecated"),
            e.attr = function (t, o, r, l) {
                var c = o.toLowerCase(),
                    h = t && t.nodeType;
                return l && (4 > s.length && i("jQuery.fn.attr( props, pass ) is deprecated"), t && !d.test(h) && (a ? o in a : e.isFunction(e.fn[o]))) ? e(t)[o](r) : ("type" === o && r !== n && u.test(t.nodeName) && t.parentNode && i("Can't change the 'type' of an input or button in IE 6/7/8"), !e.attrHooks[c] && p.test(c) && (e.attrHooks[c] = {
                    get: function (t, i) {
                        var o, r = e.prop(t, i);
                        return r === !0 || "boolean" != typeof r && (o = t.getAttributeNode(i)) && o.nodeValue !== !1 ? i.toLowerCase() : n
                    },
                    set: function (t, n, i) {
                        var o;
                        return n === !1 ? e.removeAttr(t, i) : (o = e.propFix[i] || i, o in t && (t[o] = !0), t.setAttribute(i, i.toLowerCase())),
                            i
                    }
                },
                f.test(c) && i("jQuery.fn.attr('" + c + "') may use property instead of attribute")), s.call(e, t, o, r))
            },
            e.attrHooks.value = {
                get: function (e, t) {
                    var n = (e.nodeName || "").toLowerCase();
                    return "button" === n ? l.apply(this, arguments) : ("input" !== n && "option" !== n && i("jQuery.fn.attr('value') no longer gets properties"), t in e ? e.value : null)
                },
                set: function (e, t) {
                    var o = (e.nodeName || "").toLowerCase();
                    return "button" === o ? c.apply(this, arguments) : ("input" !== o && "option" !== o && i("jQuery.fn.attr('value', val) no longer sets properties"), e.value = t, n)
                }
            };
        var h, m, g = e.fn.init,
            v = e.parseJSON,
            y = /^([^<]*)(<[\w\W]+>)([^>]*)$/;
        e.fn.init = function (t, n, o) {
            var r;
            return t && "string" == typeof t && !e.isPlainObject(n) && (r = y.exec(e.trim(t))) && r[0] && ("<" !== t.charAt(0) && i("$(html) HTML strings must start with '<' character"), r[3] && i("$(html) HTML text after last tag is ignored"), "#" === r[0].charAt(0) && (i("HTML string cannot start with a '#' character"), e.error("JQMIGRATE: Invalid selector string (XSS)")), n && n.context && (n = n.context), e.parseHTML) ? g.call(this, e.parseHTML(r[2], n, !0), n, o) : g.apply(this, arguments)
        },
            e.fn.init.prototype = e.fn,
            e.parseJSON = function (e) {
                return e || null === e ? v.apply(this, arguments) : (i("jQuery.parseJSON requires a valid JSON string"), null)
            },
            e.uaMatch = function (e) {
                e = e.toLowerCase();
                var t = /(chrome)[ \/]([\w.]+)/.exec(e) || /(webkit)[ \/]([\w.]+)/.exec(e) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e) || /(msie) ([\w.]+)/.exec(e) || 0 > e.indexOf("compatible") && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e) || [];
                return {
                    browser: t[1] || "",
                    version: t[2] || "0"
                }
            },
        e.browser || (h = e.uaMatch(navigator.userAgent), m = {},
        h.browser && (m[h.browser] = !0, m.version = h.version), m.chrome ? m.webkit = !0 : m.webkit && (m.safari = !0), e.browser = m),
            o(e, "browser", e.browser, "jQuery.browser is deprecated"),
            e.sub = function () {
                function t(e, n) {
                    return new t.fn.init(e, n)
                }

                e.extend(!0, t, this),
                    t.superclass = this,
                    t.fn = t.prototype = this(),
                    t.fn.constructor = t,
                    t.sub = this.sub,
                    t.fn.init = function (i, o) {
                        return o && o instanceof e && !(o instanceof t) && (o = t(o)),
                            e.fn.init.call(this, i, o, n)
                    },
                    t.fn.init.prototype = t.fn;
                var n = t(document);
                return i("jQuery.sub() is deprecated"),
                    t
            },
            e.ajaxSetup({
                converters: {
                    "text json": e.parseJSON
                }
            });
        var w = e.fn.data;
        e.fn.data = function (t) {
            var o, r, a = this[0];
            return !a || "events" !== t || 1 !== arguments.length || (o = e.data(a, t), r = e._data(a, t), o !== n && o !== r || r === n) ? w.apply(this, arguments) : (i("Use of jQuery.fn.data('events') is deprecated"), r)
        };
        var b = /\/(java|ecma)script/i,
            x = e.fn.andSelf || e.fn.addBack;
        e.fn.andSelf = function () {
            return i("jQuery.fn.andSelf() replaced by jQuery.fn.addBack()"),
                x.apply(this, arguments)
        },
        e.clean || (e.clean = function (t, o, r, a) {
            o = o || document,
                o = !o.nodeType && o[0] || o,
                o = o.ownerDocument || o,
                i("jQuery.clean() is deprecated");
            var s, l, c, u, d = [];
            if (e.merge(d, e.buildFragment(t, o).childNodes), r) for (c = function (e) {
                return !e.type || b.test(e.type) ? a ? a.push(e.parentNode ? e.parentNode.removeChild(e) : e) : r.appendChild(e) : n
            },
                                                                          s = 0; null != (l = d[s]); s++) e.nodeName(l, "script") && c(l) || (r.appendChild(l), l.getElementsByTagName !== n && (u = e.grep(e.merge([], l.getElementsByTagName("script")), c), d.splice.apply(d, [s + 1, 0].concat(u)), s += u.length));
            return d
        });
        var S = e.event.add,
            C = e.event.remove,
            T = e.event.trigger,
            E = e.fn.toggle,
            _ = e.fn.live,
            I = e.fn.die,
            P = "ajaxStart|ajaxStop|ajaxSend|ajaxComplete|ajaxError|ajaxSuccess",
            k = RegExp("\\b(?:" + P + ")\\b"),
            M = /(?:^|\s)hover(\.\S+|)\b/,
            H = function (t) {
                return "string" != typeof t || e.event.special.hover ? t : (M.test(t) && i("'hover' pseudo-event is deprecated, use 'mouseenter mouseleave'"), t && t.replace(M, "mouseenter$1 mouseleave$1"))
            };
        e.event.props && "attrChange" !== e.event.props[0] && e.event.props.unshift("attrChange", "attrName", "relatedNode", "srcElement"),
        e.event.dispatch && o(e.event, "handle", e.event.dispatch, "jQuery.event.handle is undocumented and deprecated"),
            e.event.add = function (e, t, n, o, r) {
                e !== document && k.test(t) && i("AJAX events should be attached to document: " + t),
                    S.call(this, e, H(t || ""), n, o, r)
            },
            e.event.remove = function (e, t, n, i, o) {
                C.call(this, e, H(t) || "", n, i, o)
            },
            e.fn.error = function () {
                var e = Array.prototype.slice.call(arguments, 0);
                return i("jQuery.fn.error() is deprecated"),
                    e.splice(0, 0, "error"),
                    arguments.length ? this.bind.apply(this, e) : (this.triggerHandler.apply(this, e), this)
            },
            e.fn.toggle = function (t, n) {
                if (!e.isFunction(t) || !e.isFunction(n)) return E.apply(this, arguments);
                i("jQuery.fn.toggle(handler, handler...) is deprecated");
                var o = arguments,
                    r = t.guid || e.guid++,
                    a = 0,
                    s = function (n) {
                        var i = (e._data(this, "lastToggle" + t.guid) || 0) % a;
                        return e._data(this, "lastToggle" + t.guid, i + 1),
                            n.preventDefault(),
                        o[i].apply(this, arguments) || !1
                    };
                for (s.guid = r; o.length > a;) o[a++].guid = r;
                return this.click(s)
            },
            e.fn.live = function (t, n, o) {
                return i("jQuery.fn.live() is deprecated"),
                    _ ? _.apply(this, arguments) : (e(this.context).on(t, this.selector, n, o), this)
            },
            e.fn.die = function (t, n) {
                return i("jQuery.fn.die() is deprecated"),
                    I ? I.apply(this, arguments) : (e(this.context).off(t, this.selector || "**", n), this)
            },
            e.event.trigger = function (e, t, n, o) {
                return n || k.test(e) || i("Global events are undocumented and deprecated"),
                    T.call(this, e, t, n || document, o)
            },
            e.each(P.split("|"),
                function (t, n) {
                    e.event.special[n] = {
                        setup: function () {
                            var t = this;
                            return t !== document && (e.event.add(document, n + "." + e.guid,
                                function () {
                                    e.event.trigger(n, null, t, !0)
                                }), e._data(this, n, e.guid++)),
                                !1
                        },
                        teardown: function () {
                            return this !== document && e.event.remove(document, n + "." + e._data(this, n)),
                                !1
                        }
                    }
                })
    }(jQuery, window),
    jQuery.easing.jswing = jQuery.easing.swing,
    jQuery.extend(jQuery.easing, {
        def: "easeOutQuad",
        swing: function (e, t, n, i, o) {
            return jQuery.easing[jQuery.easing.def](e, t, n, i, o)
        },
        easeInQuad: function (e, t, n, i, o) {
            return i * (t /= o) * t + n
        },
        easeOutQuad: function (e, t, n, i, o) {
            return -i * (t /= o) * (t - 2) + n
        },
        easeInOutQuad: function (e, t, n, i, o) {
            return (t /= o / 2) < 1 ? i / 2 * t * t + n : -i / 2 * (--t * (t - 2) - 1) + n
        },
        easeInCubic: function (e, t, n, i, o) {
            return i * (t /= o) * t * t + n
        },
        easeOutCubic: function (e, t, n, i, o) {
            return i * ((t = t / o - 1) * t * t + 1) + n
        },
        easeInOutCubic: function (e, t, n, i, o) {
            return (t /= o / 2) < 1 ? i / 2 * t * t * t + n : i / 2 * ((t -= 2) * t * t + 2) + n
        },
        easeInQuart: function (e, t, n, i, o) {
            return i * (t /= o) * t * t * t + n
        },
        easeOutQuart: function (e, t, n, i, o) {
            return -i * ((t = t / o - 1) * t * t * t - 1) + n
        },
        easeInOutQuart: function (e, t, n, i, o) {
            return (t /= o / 2) < 1 ? i / 2 * t * t * t * t + n : -i / 2 * ((t -= 2) * t * t * t - 2) + n
        },
        easeInQuint: function (e, t, n, i, o) {
            return i * (t /= o) * t * t * t * t + n
        },
        easeOutQuint: function (e, t, n, i, o) {
            return i * ((t = t / o - 1) * t * t * t * t + 1) + n
        },
        easeInOutQuint: function (e, t, n, i, o) {
            return (t /= o / 2) < 1 ? i / 2 * t * t * t * t * t + n : i / 2 * ((t -= 2) * t * t * t * t + 2) + n
        },
        easeInSine: function (e, t, n, i, o) {
            return -i * Math.cos(t / o * (Math.PI / 2)) + i + n
        },
        easeOutSine: function (e, t, n, i, o) {
            return i * Math.sin(t / o * (Math.PI / 2)) + n
        },
        easeInOutSine: function (e, t, n, i, o) {
            return -i / 2 * (Math.cos(Math.PI * t / o) - 1) + n
        },
        easeInExpo: function (e, t, n, i, o) {
            return 0 == t ? n : i * Math.pow(2, 10 * (t / o - 1)) + n
        },
        easeOutExpo: function (e, t, n, i, o) {
            return t == o ? n + i : i * (-Math.pow(2, -10 * t / o) + 1) + n
        },
        easeInOutExpo: function (e, t, n, i, o) {
            return 0 == t ? n : t == o ? n + i : (t /= o / 2) < 1 ? i / 2 * Math.pow(2, 10 * (t - 1)) + n : i / 2 * (-Math.pow(2, -10 * --t) + 2) + n
        },
        easeInCirc: function (e, t, n, i, o) {
            return -i * (Math.sqrt(1 - (t /= o) * t) - 1) + n
        },
        easeOutCirc: function (e, t, n, i, o) {
            return i * Math.sqrt(1 - (t = t / o - 1) * t) + n
        },
        easeInOutCirc: function (e, t, n, i, o) {
            return (t /= o / 2) < 1 ? -i / 2 * (Math.sqrt(1 - t * t) - 1) + n : i / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + n
        },
        easeInElastic: function (e, t, n, i, o) {
            var r = 1.70158,
                a = 0,
                s = i;
            if (0 == t) return n;
            if (1 == (t /= o)) return n + i;
            if (a || (a = .3 * o), s < Math.abs(i)) {
                s = i;
                var r = a / 4
            } else var r = a / (2 * Math.PI) * Math.asin(i / s);
            return -(s * Math.pow(2, 10 * (t -= 1)) * Math.sin(2 * (t * o - r) * Math.PI / a)) + n
        },
        easeOutElastic: function (e, t, n, i, o) {
            var r = 1.70158,
                a = 0,
                s = i;
            if (0 == t) return n;
            if (1 == (t /= o)) return n + i;
            if (a || (a = .3 * o), s < Math.abs(i)) {
                s = i;
                var r = a / 4
            } else var r = a / (2 * Math.PI) * Math.asin(i / s);
            return s * Math.pow(2, -10 * t) * Math.sin(2 * (t * o - r) * Math.PI / a) + i + n
        },
        easeInOutElastic: function (e, t, n, i, o) {
            var r = 1.70158,
                a = 0,
                s = i;
            if (0 == t) return n;
            if (2 == (t /= o / 2)) return n + i;
            if (a || (a = .3 * o * 1.5), s < Math.abs(i)) {
                s = i;
                var r = a / 4
            } else var r = a / (2 * Math.PI) * Math.asin(i / s);
            return 1 > t ? -.5 * s * Math.pow(2, 10 * (t -= 1)) * Math.sin(2 * (t * o - r) * Math.PI / a) + n : s * Math.pow(2, -10 * (t -= 1)) * Math.sin(2 * (t * o - r) * Math.PI / a) * .5 + i + n
        },
        easeInBack: function (e, t, n, i, o, r) {
            return void 0 == r && (r = 1.70158),
            i * (t /= o) * t * ((r + 1) * t - r) + n
        },
        easeOutBack: function (e, t, n, i, o, r) {
            return void 0 == r && (r = 1.70158),
            i * ((t = t / o - 1) * t * ((r + 1) * t + r) + 1) + n
        },
        easeInOutBack: function (e, t, n, i, o, r) {
            return void 0 == r && (r = 1.70158),
                (t /= o / 2) < 1 ? i / 2 * t * t * (((r *= 1.525) + 1) * t - r) + n : i / 2 * ((t -= 2) * t * (((r *= 1.525) + 1) * t + r) + 2) + n
        },
        easeInBounce: function (e, t, n, i, o) {
            return i - jQuery.easing.easeOutBounce(e, o - t, 0, i, o) + n
        },
        easeOutBounce: function (e, t, n, i, o) {
            return (t /= o) < 1 / 2.75 ? 7.5625 * i * t * t + n : 2 / 2.75 > t ? i * (7.5625 * (t -= 1.5 / 2.75) * t + .75) + n : 2.5 / 2.75 > t ? i * (7.5625 * (t -= 2.25 / 2.75) * t + .9375) + n : i * (7.5625 * (t -= 2.625 / 2.75) * t + .984375) + n
        },
        easeInOutBounce: function (e, t, n, i, o) {
            return o / 2 > t ? .5 * jQuery.easing.easeInBounce(e, 2 * t, 0, i, o) + n : .5 * jQuery.easing.easeOutBounce(e, 2 * t - o, 0, i, o) + .5 * i + n
        }
    }),
"object" != typeof JSON && (JSON = {}),
    function () {
        "use strict";

        function f(e) {
            return 10 > e ? "0" + e : e
        }

        function quote(e) {
            return escapable.lastIndex = 0,
                escapable.test(e) ? '"' + e.replace(escapable,
                    function (e) {
                        var t = meta[e];
                        return "string" == typeof t ? t : "\\u" + ("0000" + e.charCodeAt(0).toString(16)).slice(-4)
                    }) + '"' : '"' + e + '"'
        }

        function str(e, t) {
            var n, i, o, r, a, s = gap,
                l = t[e];
            switch (l && "object" == typeof l && "function" == typeof l.toJSON && (l = l.toJSON(e)), "function" == typeof rep && (l = rep.call(t, e, l)), typeof l) {
                case "string":
                    return quote(l);
                case "number":
                    return isFinite(l) ? String(l) : "null";
                case "boolean":
                case "null":
                    return String(l);
                case "object":
                    if (!l) return "null";
                    if (gap += indent, a = [], "[object Array]" === Object.prototype.toString.apply(l)) {
                        for (r = l.length, n = 0; r > n; n += 1) a[n] = str(n, l) || "null";
                        return o = 0 === a.length ? "[]" : gap ? "[\n" + gap + a.join(",\n" + gap) + "\n" + s + "]" : "[" + a.join(",") + "]",
                            gap = s,
                            o
                    }
                    if (rep && "object" == typeof rep) for (r = rep.length, n = 0; r > n; n += 1) "string" == typeof rep[n] && (i = rep[n], o = str(i, l), o && a.push(quote(i) + (gap ? ": " : ":") + o));
                    else for (i in l) Object.prototype.hasOwnProperty.call(l, i) && (o = str(i, l), o && a.push(quote(i) + (gap ? ": " : ":") + o));
                    return o = 0 === a.length ? "{}" : gap ? "{\n" + gap + a.join(",\n" + gap) + "\n" + s + "}" : "{" + a.join(",") + "}",
                        gap = s,
                        o
            }
        }

        "function" != typeof Date.prototype.toJSON && (Date.prototype.toJSON = function () {
            return isFinite(this.valueOf()) ? this.getUTCFullYear() + "-" + f(this.getUTCMonth() + 1) + "-" + f(this.getUTCDate()) + "T" + f(this.getUTCHours()) + ":" + f(this.getUTCMinutes()) + ":" + f(this.getUTCSeconds()) + "Z" : null
        },
            String.prototype.toJSON = Number.prototype.toJSON = Boolean.prototype.toJSON = function () {
                return this.valueOf()
            });
        var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
            escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
            gap, indent, meta = {
                "\b": "\\b",
                "	": "\\t",
                "\n": "\\n",
                "\f": "\\f",
                "\r": "\\r",
                '"': '\\"',
                "\\": "\\\\"
            },
            rep;
        "function" != typeof JSON.stringify && (JSON.stringify = function (e, t, n) {
            var i;
            if (gap = "", indent = "", "number" == typeof n) for (i = 0; n > i; i += 1) indent += " ";
            else "string" == typeof n && (indent = n);
            if (rep = t, !t || "function" == typeof t || "object" == typeof t && "number" == typeof t.length) return str("", {
                "": e
            });
            throw new Error("JSON.stringify")
        }),
        "function" != typeof JSON.parse && (JSON.parse = function (text, reviver) {
            function walk(e, t) {
                var n, i, o = e[t];
                if (o && "object" == typeof o) for (n in o) Object.prototype.hasOwnProperty.call(o, n) && (i = walk(o, n), void 0 !== i ? o[n] = i : delete o[n]);
                return reviver.call(e, t, o)
            }

            var j;
            if (text = String(text), cx.lastIndex = 0, cx.test(text) && (text = text.replace(cx,
                    function (e) {
                        return "\\u" + ("0000" + e.charCodeAt(0).toString(16)).slice(-4)
                    })), /^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""))) return j = eval("(" + text + ")"),
                "function" == typeof reviver ? walk({
                        "": j
                    },
                    "") : j;
            throw new SyntaxError("JSON.parse")
        })
    }(),
    function (e, t) {
        "use strict";
        var n = e.History = e.History || {},
            i = e.jQuery;
        if ("undefined" != typeof n.Adapter) throw new Error("History.js Adapter has already been loaded...");
        n.Adapter = {
            bind: function (e, t, n) {
                i(e).bind(t, n)
            },
            trigger: function (e, t, n) {
                i(e).trigger(t, n)
            },
            extractEventData: function (e, n, i) {
                var o = n && n.originalEvent && n.originalEvent[e] || i && i[e] || t;
                return o
            },
            onDomLoad: function (e) {
                i(e)
            }
        },
        "undefined" != typeof n.init && n.init()
    }(window),
    function (e) {
        "use strict";
        var t = e.document,
            n = e.setTimeout || n,
            i = e.clearTimeout || i,
            o = e.setInterval || o,
            r = e.History = e.History || {};
        if ("undefined" != typeof r.initHtml4) throw new Error("History.js HTML4 Support has already been loaded...");
        r.initHtml4 = function () {
            return "undefined" != typeof r.initHtml4.initialized ? !1 : (r.initHtml4.initialized = !0, r.enabled = !0, r.savedHashes = [], r.isLastHash = function (e) {
                var t, n = r.getHashByIndex();
                return t = e === n
            },
                r.isHashEqual = function (e, t) {
                    return e = encodeURIComponent(e).replace(/%25/g, "%"),
                        t = encodeURIComponent(t).replace(/%25/g, "%"),
                    e === t
                },
                r.saveHash = function (e) {
                    return r.isLastHash(e) ? !1 : (r.savedHashes.push(e), !0)
                },
                r.getHashByIndex = function (e) {
                    var t = null;
                    return t = "undefined" == typeof e ? r.savedHashes[r.savedHashes.length - 1] : 0 > e ? r.savedHashes[r.savedHashes.length + e] : r.savedHashes[e]
                },
                r.discardedHashes = {},
                r.discardedStates = {},
                r.discardState = function (e, t, n) {
                    var i, o = r.getHashByState(e);
                    return i = {
                        discardedState: e,
                        backState: n,
                        forwardState: t
                    },
                        r.discardedStates[o] = i,
                        !0
                },
                r.discardHash = function (e, t, n) {
                    var i = {
                        discardedHash: e,
                        backState: n,
                        forwardState: t
                    };
                    return r.discardedHashes[e] = i,
                        !0
                },
                r.discardedState = function (e) {
                    var t, n = r.getHashByState(e);
                    return t = r.discardedStates[n] || !1
                },
                r.discardedHash = function (e) {
                    var t = r.discardedHashes[e] || !1;
                    return t
                },
                r.recycleState = function (e) {
                    var t = r.getHashByState(e);
                    return r.discardedState(e) && delete r.discardedStates[t],
                        !0
                },
            r.emulated.hashChange && (r.hashChangeInit = function () {
                r.checkerFunction = null;
                var n, i, a, s, l = "",
                    c = Boolean(r.getHash());
                return r.isInternetExplorer() ? (n = "historyjs-iframe", i = t.createElement("iframe"), i.setAttribute("id", n), i.setAttribute("src", "#"), i.style.display = "none", t.body.appendChild(i), i.contentWindow.document.open(), i.contentWindow.document.close(), a = "", s = !1, r.checkerFunction = function () {
                    if (s) return !1;
                    s = !0;
                    var t = r.getHash(),
                        n = r.getHash(i.contentWindow.document);
                    return t !== l ? (l = t, n !== t && (a = n = t, i.contentWindow.document.open(), i.contentWindow.document.close(), i.contentWindow.document.location.hash = r.escapeHash(t)), r.Adapter.trigger(e, "hashchange")) : n !== a && (a = n, c && "" === n ? r.back() : r.setHash(n, !1)),
                        s = !1,
                        !0
                }) : r.checkerFunction = function () {
                    var t = r.getHash() || "";
                    return t !== l && (l = t, r.Adapter.trigger(e, "hashchange")),
                        !0
                },
                    r.intervalList.push(o(r.checkerFunction, r.options.hashChangeInterval)),
                    !0
            },
                r.Adapter.onDomLoad(r.hashChangeInit)), r.emulated.pushState && (r.onHashChange = function (t) {
                var n, i = t && t.newURL || r.getLocationHref(),
                    o = r.getHashByUrl(i),
                    a = null,
                    s = null;
                return r.isLastHash(o) ? (r.busy(!1), !1) : (r.doubleCheckComplete(), r.saveHash(o), o && r.isTraditionalAnchor(o) ? (r.Adapter.trigger(e, "anchorchange"), r.busy(!1), !1) : (a = r.extractState(r.getFullUrl(o || r.getLocationHref()), !0), r.isLastSavedState(a) ? (r.busy(!1), !1) : (s = r.getHashByState(a), n = r.discardedState(a), n ? (r.getHashByIndex(-2) === r.getHashByState(n.forwardState) ? r.back(!1) : r.forward(!1), !1) : (r.pushState(a.data, a.title, encodeURI(a.url), !1), !0))))
            },
                r.Adapter.bind(e, "hashchange", r.onHashChange), r.pushState = function (t, n, i, o) {
                if (i = encodeURI(i).replace(/%25/g, "%"), r.getHashByUrl(i)) throw new Error("History.js does not support states with fragment-identifiers (hashes/anchors).");
                if (o !== !1 && r.busy()) return r.pushQueue({
                    scope: r,
                    callback: r.pushState,
                    args: arguments,
                    queue: o
                }),
                    !1;
                r.busy(!0);
                var a = r.createStateObject(t, n, i),
                    s = r.getHashByState(a),
                    l = r.getState(!1),
                    c = r.getHashByState(l),
                    u = r.getHash(),
                    d = r.expectedStateId == a.id;
                return r.storeState(a),
                    r.expectedStateId = a.id,
                    r.recycleState(a),
                    r.setTitle(a),
                    s === c ? (r.busy(!1), !1) : (r.saveState(a), d || r.Adapter.trigger(e, "statechange"), !r.isHashEqual(s, u) && !r.isHashEqual(s, r.getShortUrl(r.getLocationHref())) && r.setHash(s, !1), r.busy(!1), !0)
            },
                r.replaceState = function (t, n, i, o) {
                    if (i = encodeURI(i).replace(/%25/g, "%"), r.getHashByUrl(i)) throw new Error("History.js does not support states with fragment-identifiers (hashes/anchors).");
                    if (o !== !1 && r.busy()) return r.pushQueue({
                        scope: r,
                        callback: r.replaceState,
                        args: arguments,
                        queue: o
                    }),
                        !1;
                    r.busy(!0);
                    var a = r.createStateObject(t, n, i),
                        s = r.getHashByState(a),
                        l = r.getState(!1),
                        c = r.getHashByState(l),
                        u = r.getStateByIndex(-2);
                    return r.discardState(l, a, u),
                        s === c ? (r.storeState(a), r.expectedStateId = a.id, r.recycleState(a), r.setTitle(a), r.saveState(a), r.Adapter.trigger(e, "statechange"), r.busy(!1)) : r.pushState(a.data, a.title, a.url, !1),
                        !0
                }), r.emulated.pushState && r.getHash() && !r.emulated.hashChange && r.Adapter.onDomLoad(function () {
                r.Adapter.trigger(e, "hashchange")
            }), void 0)
        },
        "undefined" != typeof r.init && r.init()
    }(window),
    function (e, t) {
        "use strict";
        var n = e.console || t,
            i = e.document,
            o = e.navigator,
            r = !1,
            a = e.setTimeout,
            s = e.clearTimeout,
            l = e.setInterval,
            c = e.clearInterval,
            u = e.JSON,
            d = e.alert,
            p = e.History = e.History || {},
            f = e.history;
        try {
            r = e.sessionStorage,
                r.setItem("TEST", "1"),
                r.removeItem("TEST")
        } catch (h) {
            r = !1
        }
        if (u.stringify = u.stringify || u.encode, u.parse = u.parse || u.decode, "undefined" != typeof p.init) throw new Error("History.js Core has already been loaded...");
        p.init = function () {
            return "undefined" == typeof p.Adapter ? !1 : ("undefined" != typeof p.initCore && p.initCore(), "undefined" != typeof p.initHtml4 && p.initHtml4(), !0)
        },
            p.initCore = function () {
                if ("undefined" != typeof p.initCore.initialized) return !1;
                if (p.initCore.initialized = !0, p.options = p.options || {},
                        p.options.hashChangeInterval = p.options.hashChangeInterval || 100, p.options.safariPollInterval = p.options.safariPollInterval || 500, p.options.doubleCheckInterval = p.options.doubleCheckInterval || 500, p.options.disableSuid = p.options.disableSuid || !1, p.options.storeInterval = p.options.storeInterval || 1e3, p.options.busyDelay = p.options.busyDelay || 250, p.options.debug = p.options.debug || !1, p.options.initialTitle = p.options.initialTitle || i.title, p.options.html4Mode = p.options.html4Mode || !1, p.options.delayInit = p.options.delayInit || !1, p.intervalList = [], p.clearAllIntervals = function () {
                        var e, t = p.intervalList;
                        if ("undefined" != typeof t && null !== t) {
                            for (e = 0; e < t.length; e++) c(t[e]);
                            p.intervalList = null
                        }
                    },
                        p.debug = function () {
                            (p.options.debug || !1) && p.log.apply(p, arguments)
                        },
                        p.log = function () {
                            var e, t, o, r, a,
                                s = "undefined" != typeof n && "undefined" != typeof n.log && "undefined" != typeof n.log.apply,
                                l = i.getElementById("log");
                            for (s ? (r = Array.prototype.slice.call(arguments), e = r.shift(), "undefined" != typeof n.debug ? n.debug.apply(n, [e, r]) : n.log.apply(n, [e, r])) : e = "\n" + arguments[0] + "\n", t = 1, o = arguments.length; o > t; ++t) {
                                if (a = arguments[t], "object" == typeof a && "undefined" != typeof u) try {
                                    a = u.stringify(a)
                                } catch (c) {
                                }
                                e += "\n" + a + "\n"
                            }
                            return l ? (l.value += e + "\n-----\n", l.scrollTop = l.scrollHeight - l.clientHeight) : s || d(e),
                                !0
                        },
                        p.getInternetExplorerMajorVersion = function () {
                            var e = p.getInternetExplorerMajorVersion.cached = "undefined" != typeof p.getInternetExplorerMajorVersion.cached ? p.getInternetExplorerMajorVersion.cached : function () {
                                for (var e = 3,
                                         t = i.createElement("div"), n = t.getElementsByTagName("i"); (t.innerHTML = "<!--[if gt IE " + ++e + "]><i></i><![endif]-->") && n[0];) ;
                                return e > 4 ? e : !1
                            }();
                            return e
                        },
                        p.isInternetExplorer = function () {
                            var e = p.isInternetExplorer.cached = "undefined" != typeof p.isInternetExplorer.cached ? p.isInternetExplorer.cached : Boolean(p.getInternetExplorerMajorVersion());
                            return e
                        },
                        p.emulated = p.options.html4Mode ? {
                            pushState: !0,
                            hashChange: !0
                        } : {
                            pushState: !Boolean(e.history && e.history.pushState && e.history.replaceState && !/ Mobile\/([1-7][a-z]|(8([abcde]|f(1[0-8]))))/i.test(o.userAgent) && !/AppleWebKit\/5([0-2]|3[0-2])/i.test(o.userAgent)),
                            hashChange: Boolean(!("onhashchange" in e || "onhashchange" in i) || p.isInternetExplorer() && p.getInternetExplorerMajorVersion() < 8)
                        },
                        p.enabled = !p.emulated.pushState, p.bugs = {
                        setHash: Boolean(!p.emulated.pushState && "Apple Computer, Inc." === o.vendor && /AppleWebKit\/5([0-2]|3[0-3])/.test(o.userAgent)),
                        safariPoll: Boolean(!p.emulated.pushState && "Apple Computer, Inc." === o.vendor && /AppleWebKit\/5([0-2]|3[0-3])/.test(o.userAgent)),
                        ieDoubleCheck: Boolean(p.isInternetExplorer() && p.getInternetExplorerMajorVersion() < 8),
                        hashEscape: Boolean(p.isInternetExplorer() && p.getInternetExplorerMajorVersion() < 7)
                    },
                        p.isEmptyObject = function (e) {
                            for (var t in e) if (e.hasOwnProperty(t)) return !1;
                            return !0
                        },
                        p.cloneObject = function (e) {
                            var t, n;
                            return e ? (t = u.stringify(e), n = u.parse(t)) : n = {},
                                n
                        },
                        p.getRootUrl = function () {
                            var e = i.location.protocol + "//" + (i.location.hostname || i.location.host);
                            return i.location.port && (e += ":" + i.location.port),
                                e += "/"
                        },
                        p.getBaseHref = function () {
                            var e = i.getElementsByTagName("base"),
                                t = null,
                                n = "";
                            return 1 === e.length && (t = e[0], n = t.href.replace(/[^\/]+$/, "")),
                                n = n.replace(/\/+$/, ""),
                            n && (n += "/"),
                                n
                        },
                        p.getBaseUrl = function () {
                            var e = p.getBaseHref() || p.getBasePageUrl() || p.getRootUrl();
                            return e
                        },
                        p.getPageUrl = function () {
                            var e, t = p.getState(!1, !1),
                                n = (t || {}).url || p.getLocationHref();
                            return e = n.replace(/\/+$/, "").replace(/[^\/]+$/,
                                function (e) {
                                    return /\./.test(e) ? e : e + "/"
                                })
                        },
                        p.getBasePageUrl = function () {
                            var e = p.getLocationHref().replace(/[#\?].*/, "").replace(/[^\/]+$/,
                                function (e) {
                                    return /[^\/]$/.test(e) ? "" : e
                                }).replace(/\/+$/, "") + "/";
                            return e
                        },
                        p.getFullUrl = function (e, t) {
                            var n = e,
                                i = e.substring(0, 1);
                            return t = "undefined" == typeof t ? !0 : t,
                            /[a-z]+\:\/\//.test(e) || (n = "/" === i ? p.getRootUrl() + e.replace(/^\/+/, "") : "#" === i ? p.getPageUrl().replace(/#.*/, "") + e : "?" === i ? p.getPageUrl().replace(/[\?#].*/, "") + e : t ? p.getBaseUrl() + e.replace(/^(\.\/)+/, "") : p.getBasePageUrl() + e.replace(/^(\.\/)+/, "")),
                                n.replace(/\#$/, "")
                        },
                        p.getShortUrl = function (e) {
                            var t = e,
                                n = p.getBaseUrl(),
                                i = p.getRootUrl();
                            return p.emulated.pushState && (t = t.replace(n, "")),
                                t = t.replace(i, "/"),
                            p.isTraditionalAnchor(t) && (t = "./" + t),
                                t = t.replace(/^(\.\/)+/g, "./").replace(/\#$/, "")
                        },
                        p.getLocationHref = function (e) {
                            return e = e || i,
                                e.URL === e.location.href ? e.location.href : e.location.href === decodeURIComponent(e.URL) ? e.URL : e.location.hash && decodeURIComponent(e.location.href.replace(/^[^#]+/, "")) === e.location.hash ? e.location.href : -1 == e.URL.indexOf("#") && -1 != e.location.href.indexOf("#") ? e.location.href : e.URL || e.location.href
                        },
                        p.store = {},
                        p.idToState = p.idToState || {},
                        p.stateToId = p.stateToId || {},
                        p.urlToId = p.urlToId || {},
                        p.storedStates = p.storedStates || [], p.savedStates = p.savedStates || [], p.normalizeStore = function () {
                        p.store.idToState = p.store.idToState || {},
                            p.store.urlToId = p.store.urlToId || {},
                            p.store.stateToId = p.store.stateToId || {}
                    },
                        p.getState = function (e, t) {
                            "undefined" == typeof e && (e = !0),
                            "undefined" == typeof t && (t = !0);
                            var n = p.getLastSavedState();
                            return !n && t && (n = p.createStateObject()),
                            e && (n = p.cloneObject(n), n.url = n.cleanUrl || n.url),
                                n
                        },
                        p.getIdByState = function (e) {
                            var t, n = p.extractId(e.url);
                            if (!n) if (t = p.getStateString(e), "undefined" != typeof p.stateToId[t]) n = p.stateToId[t];
                            else if ("undefined" != typeof p.store.stateToId[t]) n = p.store.stateToId[t];
                            else {
                                for (; n = (new Date).getTime() + String(Math.random()).replace(/\D/g, ""), "undefined" != typeof p.idToState[n] || "undefined" != typeof p.store.idToState[n];) ;
                                p.stateToId[t] = n,
                                    p.idToState[n] = e
                            }
                            return n
                        },
                        p.normalizeState = function (e) {
                            var t, n;
                            return e && "object" == typeof e || (e = {}),
                                "undefined" != typeof e.normalized ? e : (e.data && "object" == typeof e.data || (e.data = {}), t = {},
                                    t.normalized = !0, t.title = e.title || "", t.url = p.getFullUrl(e.url ? e.url : p.getLocationHref()), t.hash = p.getShortUrl(t.url), t.data = p.cloneObject(e.data), t.id = p.getIdByState(t), t.cleanUrl = t.url.replace(/\??\&_suid.*/, ""), t.url = t.cleanUrl, n = !p.isEmptyObject(t.data), (t.title || n) && p.options.disableSuid !== !0 && (t.hash = p.getShortUrl(t.url).replace(/\??\&_suid.*/, ""), /\?/.test(t.hash) || (t.hash += "?"), t.hash += "&_suid=" + t.id), t.hashedUrl = p.getFullUrl(t.hash), (p.emulated.pushState || p.bugs.safariPoll) && p.hasUrlDuplicate(t) && (t.url = t.hashedUrl), t)
                        },
                        p.createStateObject = function (e, t, n) {
                            var i = {
                                data: e,
                                title: t,
                                url: n
                            };
                            return i = p.normalizeState(i)
                        },
                        p.getStateById = function (e) {
                            e = String(e);
                            var n = p.idToState[e] || p.store.idToState[e] || t;
                            return n
                        },
                        p.getStateString = function (e) {
                            var t, n, i;
                            return t = p.normalizeState(e),
                                n = {
                                    data: t.data,
                                    title: e.title,
                                    url: e.url
                                },
                                i = u.stringify(n)
                        },
                        p.getStateId = function (e) {
                            var t, n;
                            return t = p.normalizeState(e),
                                n = t.id
                        },
                        p.getHashByState = function (e) {
                            var t, n;
                            return t = p.normalizeState(e),
                                n = t.hash
                        },
                        p.extractId = function (e) {
                            var t, n, i, o;
                            return o = -1 != e.indexOf("#") ? e.split("#")[0] : e,
                                n = /(.*)\&_suid=([0-9]+)$/.exec(o),
                                i = n ? n[1] || e : e,
                                t = n ? String(n[2] || "") : "",
                            t || !1
                        },
                        p.isTraditionalAnchor = function (e) {
                            var t = !/[\/\?\.]/.test(e);
                            return t
                        },
                        p.extractState = function (e, t) {
                            var n, i, o = null;
                            return t = t || !1,
                                n = p.extractId(e),
                            n && (o = p.getStateById(n)),
                            o || (i = p.getFullUrl(e), n = p.getIdByUrl(i) || !1, n && (o = p.getStateById(n)), !o && t && !p.isTraditionalAnchor(e) && (o = p.createStateObject(null, null, i))),
                                o
                        },
                        p.getIdByUrl = function (e) {
                            var n = p.urlToId[e] || p.store.urlToId[e] || t;
                            return n
                        },
                        p.getLastSavedState = function () {
                            return p.savedStates[p.savedStates.length - 1] || t
                        },
                        p.getLastStoredState = function () {
                            return p.storedStates[p.storedStates.length - 1] || t
                        },
                        p.hasUrlDuplicate = function (e) {
                            var t, n = !1;
                            return t = p.extractState(e.url),
                                n = t && t.id !== e.id
                        },
                        p.storeState = function (e) {
                            return p.urlToId[e.url] = e.id,
                                p.storedStates.push(p.cloneObject(e)),
                                e
                        },
                        p.isLastSavedState = function (e) {
                            var t, n, i, o = !1;
                            return p.savedStates.length && (t = e.id, n = p.getLastSavedState(), i = n.id, o = t === i),
                                o
                        },
                        p.saveState = function (e) {
                            return p.isLastSavedState(e) ? !1 : (p.savedStates.push(p.cloneObject(e)), !0)
                        },
                        p.getStateByIndex = function (e) {
                            var t = null;
                            return t = "undefined" == typeof e ? p.savedStates[p.savedStates.length - 1] : 0 > e ? p.savedStates[p.savedStates.length + e] : p.savedStates[e]
                        },
                        p.getCurrentIndex = function () {
                            var e = null;
                            return e = p.savedStates.length < 1 ? 0 : p.savedStates.length - 1
                        },
                        p.getHash = function (e) {
                            var t, n = p.getLocationHref(e);
                            return t = p.getHashByUrl(n)
                        },
                        p.unescapeHash = function (e) {
                            var t = p.normalizeHash(e);
                            return t = decodeURIComponent(t)
                        },
                        p.normalizeHash = function (e) {
                            var t = e.replace(/[^#]*#/, "").replace(/#.*/, "");
                            return t
                        },
                        p.setHash = function (e, t) {
                            var n, o;
                            return t !== !1 && p.busy() ? (p.pushQueue({
                                scope: p,
                                callback: p.setHash,
                                args: arguments,
                                queue: t
                            }), !1) : (p.busy(!0), n = p.extractState(e, !0), n && !p.emulated.pushState ? p.pushState(n.data, n.title, n.url, !1) : p.getHash() !== e && (p.bugs.setHash ? (o = p.getPageUrl(), p.pushState(null, null, o + "#" + e, !1)) : i.location.hash = e), p)
                        },
                        p.escapeHash = function (t) {
                            var n = p.normalizeHash(t);
                            return n = e.encodeURIComponent(n),
                            p.bugs.hashEscape || (n = n.replace(/\%21/g, "!").replace(/\%26/g, "&").replace(/\%3D/g, "=").replace(/\%3F/g, "?")),
                                n
                        },
                        p.getHashByUrl = function (e) {
                            var t = String(e).replace(/([^#]*)#?([^#]*)#?(.*)/, "$2");
                            return t = p.unescapeHash(t)
                        },
                        p.setTitle = function (e) {
                            var t, n = e.title;
                            n || (t = p.getStateByIndex(0), t && t.url === e.url && (n = t.title || p.options.initialTitle));
                            try {
                                i.getElementsByTagName("title")[0].innerHTML = n.replace("<", "&lt;").replace(">", "&gt;").replace(" & ", " &amp; ")
                            } catch (o) {
                            }
                            return i.title = n,
                                p
                        },
                        p.queues = [], p.busy = function (e) {
                        if ("undefined" != typeof e ? p.busy.flag = e : "undefined" == typeof p.busy.flag && (p.busy.flag = !1), !p.busy.flag) {
                            s(p.busy.timeout);
                            var t = function () {
                                var e, n, i;
                                if (!p.busy.flag) for (e = p.queues.length - 1; e >= 0; --e) n = p.queues[e],
                                0 !== n.length && (i = n.shift(), p.fireQueueItem(i), p.busy.timeout = a(t, p.options.busyDelay))
                            };
                            p.busy.timeout = a(t, p.options.busyDelay)
                        }
                        return p.busy.flag
                    },
                        p.busy.flag = !1, p.fireQueueItem = function (e) {
                        return e.callback.apply(e.scope || p, e.args || [])
                    },
                        p.pushQueue = function (e) {
                            return p.queues[e.queue || 0] = p.queues[e.queue || 0] || [],
                                p.queues[e.queue || 0].push(e),
                                p
                        },
                        p.queue = function (e, t) {
                            return "function" == typeof e && (e = {
                                callback: e
                            }),
                            "undefined" != typeof t && (e.queue = t),
                                p.busy() ? p.pushQueue(e) : p.fireQueueItem(e),
                                p
                        },
                        p.clearQueue = function () {
                            return p.busy.flag = !1,
                                p.queues = [],
                                p
                        },
                        p.stateChanged = !1, p.doubleChecker = !1, p.doubleCheckComplete = function () {
                        return p.stateChanged = !0,
                            p.doubleCheckClear(),
                            p
                    },
                        p.doubleCheckClear = function () {
                            return p.doubleChecker && (s(p.doubleChecker), p.doubleChecker = !1),
                                p
                        },
                        p.doubleCheck = function (e) {
                            return p.stateChanged = !1,
                                p.doubleCheckClear(),
                            p.bugs.ieDoubleCheck && (p.doubleChecker = a(function () {
                                    return p.doubleCheckClear(),
                                    p.stateChanged || e(),
                                        !0
                                },
                                p.options.doubleCheckInterval)),
                                p
                        },
                        p.safariStatePoll = function () {
                            var t, n = p.extractState(p.getLocationHref());
                            return p.isLastSavedState(n) ? void 0 : (t = n, t || (t = p.createStateObject()), p.Adapter.trigger(e, "popstate"), p)
                        },
                        p.back = function (e) {
                            return e !== !1 && p.busy() ? (p.pushQueue({
                                scope: p,
                                callback: p.back,
                                args: arguments,
                                queue: e
                            }), !1) : (p.busy(!0), p.doubleCheck(function () {
                                p.back(!1)
                            }), f.go(-1), !0)
                        },
                        p.forward = function (e) {
                            return e !== !1 && p.busy() ? (p.pushQueue({
                                scope: p,
                                callback: p.forward,
                                args: arguments,
                                queue: e
                            }), !1) : (p.busy(!0), p.doubleCheck(function () {
                                p.forward(!1)
                            }), f.go(1), !0)
                        },
                        p.go = function (e, t) {
                            var n;
                            if (e > 0) for (n = 1; e >= n; ++n) p.forward(t);
                            else {
                                if (!(0 > e)) throw new Error("History.go: History.go requires a positive or negative integer passed.");
                                for (n = -1; n >= e; --n) p.back(t)
                            }
                            return p
                        },
                        p.emulated.pushState) {
                    var h = function () {
                    };
                    p.pushState = p.pushState || h,
                        p.replaceState = p.replaceState || h
                } else p.onPopState = function (t, n) {
                    var i, o, r = !1,
                        a = !1;
                    return p.doubleCheckComplete(),
                        i = p.getHash(),
                        i ? (o = p.extractState(i || p.getLocationHref(), !0), o ? p.replaceState(o.data, o.title, o.url, !1) : (p.Adapter.trigger(e, "anchorchange"), p.busy(!1)), p.expectedStateId = !1, !1) : (r = p.Adapter.extractEventData("state", t, n) || !1, a = r ? p.getStateById(r) : p.expectedStateId ? p.getStateById(p.expectedStateId) : p.extractState(p.getLocationHref()), a || (a = p.createStateObject(null, null, p.getLocationHref())), p.expectedStateId = !1, p.isLastSavedState(a) ? (p.busy(!1), !1) : (p.storeState(a), p.saveState(a), p.setTitle(a), p.Adapter.trigger(e, "statechange"), p.busy(!1), !0))
                },
                    p.Adapter.bind(e, "popstate", p.onPopState),
                    p.pushState = function (t, n, i, o) {
                        if (p.getHashByUrl(i) && p.emulated.pushState) throw new Error("History.js does not support states with fragement-identifiers (hashes/anchors).");
                        if (o !== !1 && p.busy()) return p.pushQueue({
                            scope: p,
                            callback: p.pushState,
                            args: arguments,
                            queue: o
                        }),
                            !1;
                        p.busy(!0);
                        var r = p.createStateObject(t, n, i);
                        return p.isLastSavedState(r) ? p.busy(!1) : (p.storeState(r), p.expectedStateId = r.id, f.pushState(r.id, r.title, r.url), p.Adapter.trigger(e, "popstate")),
                            !0
                    },
                    p.replaceState = function (t, n, i, o) {
                        if (p.getHashByUrl(i) && p.emulated.pushState) throw new Error("History.js does not support states with fragement-identifiers (hashes/anchors).");
                        if (o !== !1 && p.busy()) return p.pushQueue({
                            scope: p,
                            callback: p.replaceState,
                            args: arguments,
                            queue: o
                        }),
                            !1;
                        p.busy(!0);
                        var r = p.createStateObject(t, n, i);
                        return p.isLastSavedState(r) ? p.busy(!1) : (p.storeState(r), p.expectedStateId = r.id, f.replaceState(r.id, r.title, r.url), p.Adapter.trigger(e, "popstate")),
                            !0
                    };
                if (r) {
                    try {
                        p.store = u.parse(r.getItem("History.store")) || {}
                    } catch (m) {
                        p.store = {}
                    }
                    p.normalizeStore()
                } else p.store = {},
                    p.normalizeStore();
                p.Adapter.bind(e, "unload", p.clearAllIntervals),
                    p.saveState(p.storeState(p.extractState(p.getLocationHref(), !0))),
                r && (p.onUnload = function () {
                    var e, t, n;
                    try {
                        e = u.parse(r.getItem("History.store")) || {}
                    } catch (i) {
                        e = {}
                    }
                    e.idToState = e.idToState || {},
                        e.urlToId = e.urlToId || {},
                        e.stateToId = e.stateToId || {};
                    for (t in p.idToState) p.idToState.hasOwnProperty(t) && (e.idToState[t] = p.idToState[t]);
                    for (t in p.urlToId) p.urlToId.hasOwnProperty(t) && (e.urlToId[t] = p.urlToId[t]);
                    for (t in p.stateToId) p.stateToId.hasOwnProperty(t) && (e.stateToId[t] = p.stateToId[t]);
                    p.store = e,
                        p.normalizeStore(),
                        n = u.stringify(e);
                    try {
                        r.setItem("History.store", n)
                    } catch (o) {
                        if (o.code !== DOMException.QUOTA_EXCEEDED_ERR) throw o;
                        r.length && (r.removeItem("History.store"), r.setItem("History.store", n))
                    }
                },
                    p.intervalList.push(l(p.onUnload, p.options.storeInterval)), p.Adapter.bind(e, "beforeunload", p.onUnload), p.Adapter.bind(e, "unload", p.onUnload)),
                p.emulated.pushState || (p.bugs.safariPoll && p.intervalList.push(l(p.safariStatePoll, p.options.safariPollInterval)), ("Apple Computer, Inc." === o.vendor || "Mozilla" === (o.appCodeName || "")) && (p.Adapter.bind(e, "hashchange",
                    function () {
                        p.Adapter.trigger(e, "popstate")
                    }), p.getHash() && p.Adapter.onDomLoad(function () {
                    p.Adapter.trigger(e, "hashchange")
                })))
            },
        (!p.options || !p.options.delayInit) && p.init()
    }(window),
    function (e, t) {
        "function" == typeof define && define.amd ? define(t) : "object" == typeof exports ? module.exports = t() : e.NProgress = t()
    }(this,function () {
            function e(e, t, n) {
                return t > e ? t : e > n ? n : e
            }

            function t(e) {
                return 100 * (-1 + e)
            }

            function n(e, n, i) {
                var o;
                return o = "translate3d" === c.positionUsing ? {
                    transform: "translate3d(" + t(e) + "%,0,0)"
                } : "translate" === c.positionUsing ? {
                    transform: "translate(" + t(e) + "%,0)"
                } : {
                    "margin-left": t(e) + "%"
                },
                    o.transition = "all " + n + "ms " + i,
                    o
            }

            function i(e, t) {
                var n = "string" == typeof e ? e : a(e);
                return n.indexOf(" " + t + " ") >= 0
            }

            function o(e, t) {
                var n = a(e),
                    o = n + t;
                i(n, t) || (e.className = o.substring(1))
            }

            function r(e, t) {
                var n, o = a(e);
                i(e, t) && (n = o.replace(" " + t + " ", " "), e.className = n.substring(1, n.length - 1))
            }

            function a(e) {
                return (" " + (e.className || "") + " ").replace(/\s+/gi, " ")
            }

            function s(e) {
                e && e.parentNode && e.parentNode.removeChild(e)
            }

            var l = {};
            l.version = "0.2.0";
            var c = l.settings = {
                minimum: .08,
                easing: "ease",
                positionUsing: "",
                speed: 200,
                trickle: !0,
                trickleRate: .02,
                trickleSpeed: 800,
                showSpinner: !0,
                barSelector: '[role="bar"]',
                spinnerSelector: '[role="spinner"]',
                parent: "body",
                template: '<div class="bar" role="bar"><div class="peg"></div></div><div class="spinner" role="spinner"><div class="spinner-icon"></div></div>'
            };
            l.configure = function (e) {
                var t, n;
                for (t in e) n = e[t],
                void 0 !== n && e.hasOwnProperty(t) && (c[t] = n);
                return this
            },
                l.status = null,
                l.set = function (t) {
                    var i = l.isStarted();
                    t = e(t, c.minimum, 1),
                        l.status = 1 === t ? null : t;
                    var o = l.render(!i),
                        r = o.querySelector(c.barSelector),
                        a = c.speed,
                        s = c.easing;
                    return o.offsetWidth,
                        u(function (e) {
                            "" === c.positionUsing && (c.positionUsing = l.getPositioningCSS()),
                                d(r, n(t, a, s)),
                                1 === t ? (d(o, {
                                    transition: "none",
                                    opacity: 1
                                }), o.offsetWidth, setTimeout(function () {
                                        d(o, {
                                            transition: "all " + a + "ms linear",
                                            opacity: 0
                                        }),
                                            setTimeout(function () {
                                                    l.remove(),
                                                        e()
                                                },
                                                a)
                                    },
                                    a)) : setTimeout(e, a)
                        }),
                        this
                },
                l.isStarted = function () {
                    return "number" == typeof l.status
                },
                l.start = function () {
                    l.status || l.set(0);
                    var e = function () {
                        setTimeout(function () {
                                l.status && (l.trickle(), e())
                            },
                            c.trickleSpeed)
                    };
                    return c.trickle && e(),
                        this
                },
                l.done = function (e) {
                    return e || l.status ? l.inc(.3 + .5 * Math.random()).set(1) : this
                },
                l.inc = function (t) {
                    var n = l.status;
                    return n ? ("number" != typeof t && (t = (1 - n) * e(Math.random() * n, .1, .95)), n = e(n + t, 0, .994), l.set(n)) : l.start()
                },
                l.trickle = function () {
                    return l.inc(Math.random() * c.trickleRate)
                },
                function () {
                    var e = 0,
                        t = 0;
                    l.promise = function (n) {
                        return n && "resolved" !== n.state() ? (0 === t && l.start(), e++, t++, n.always(function () {
                            t--,
                                0 === t ? (e = 0, l.done()) : l.set((e - t) / e)
                        }), this) : this
                    }
                }(),
                l.render = function (e) {
                    if (l.isRendered()) return document.getElementById("nprogress");
                    o(document.documentElement, "nprogress-busy");
                    var n = document.createElement("div");
                    n.id = "nprogress",
                        n.innerHTML = c.template;
                    var i, r = n.querySelector(c.barSelector),
                        a = e ? "-100" : t(l.status || 0),
                        u = document.querySelector(c.parent);
                    return d(r, {
                        transition: "all 0 linear",
                        transform: "translate3d(" + a + "%,0,0)"
                    }),
                    c.showSpinner || (i = n.querySelector(c.spinnerSelector), i && s(i)),
                    u != document.body && o(u, "nprogress-custom-parent"),
                        u.appendChild(n),
                        n
                },
                l.remove = function () {
                    r(document.documentElement, "nprogress-busy"),
                        r(document.querySelector(c.parent), "nprogress-custom-parent");
                    var e = document.getElementById("nprogress");
                    e && s(e)
                },
                l.isRendered = function () {
                    return !!document.getElementById("nprogress")
                },
                l.getPositioningCSS = function () {
                    var e = document.body.style,
                        t = "WebkitTransform" in e ? "Webkit" : "MozTransform" in e ? "Moz" : "msTransform" in e ? "ms" : "OTransform" in e ? "O" : "";
                    return t + "Perspective" in e ? "translate3d" : t + "Transform" in e ? "translate" : "margin"
                };
            var u = function () {
                    function e() {
                        var n = t.shift();
                        n && n(e)
                    }

                    var t = [];
                    return function (n) {
                        t.push(n),
                        1 == t.length && e()
                    }
                }(),
                d = function () {
                    function e(e) {
                        return e.replace(/^-ms-/, "ms-").replace(/-([\da-z])/gi,
                            function (e, t) {
                                return t.toUpperCase()
                            })
                    }

                    function t(e) {
                        var t = document.body.style;
                        if (e in t) return e;
                        for (var n, i = o.length,
                                 r = e.charAt(0).toUpperCase() + e.slice(1); i--;) if (n = o[i] + r, n in t) return n;
                        return e
                    }

                    function n(n) {
                        return n = e(n),
                        r[n] || (r[n] = t(n))
                    }

                    function i(e, t, i) {
                        t = n(t),
                            e.style[t] = i
                    }

                    var o = ["Webkit", "O", "Moz", "ms"],
                        r = {};
                    return function (e, t) {
                        var n, o, r = arguments;
                        if (2 == r.length) for (n in t) o = t[n],
                        void 0 !== o && t.hasOwnProperty(n) && i(e, n, o);
                        else i(e, r[1], r[2])
                    }
                }();
            return l
        }),function (e, t) {
        "object" == typeof exports ? module.exports = t() : "function" == typeof define && define.amd ? define(t) : e.Spinner = t()
    }(this,function () {
            "use strict";

            function e(e, t) {
                var n, i = document.createElement(e || "div");
                for (n in t) i[n] = t[n];
                return i
            }

            function t(e) {
                for (var t = 1,
                         n = arguments.length; n > t; t++) e.appendChild(arguments[t]);
                return e
            }

            function n(e, t, n, i) {
                var o = ["opacity", t, ~~(100 * e), n, i].join("-"),
                    r = .01 + 100 * (n / i),
                    a = Math.max(1 - (1 - e) / t * (100 - r), e),
                    s = c.substring(0, c.indexOf("Animation")).toLowerCase(),
                    l = s && "-" + s + "-" || "";
                return d[o] || (p.insertRule("@" + l + "keyframes " + o + "{0%{opacity:" + a + "}" + r + "%{opacity:" + e + "}" + (r + .01) + "%{opacity:1}" + (r + t) % 100 + "%{opacity:" + e + "}100%{opacity:" + a + "}}", p.cssRules.length), d[o] = 1),
                    o
            }

            function i(e, t) {
                var n, i, o = e.style;
                if (void 0 !== o[t]) return t;
                for (t = t.charAt(0).toUpperCase() + t.slice(1), i = 0; u.length > i; i++) if (n = u[i] + t, void 0 !== o[n]) return n
            }

            function o(e, t) {
                for (var n in t) e.style[i(e, n) || n] = t[n];
                return e
            }

            function r(e) {
                for (var t = 1; arguments.length > t; t++) {
                    var n = arguments[t];
                    for (var i in n) void 0 === e[i] && (e[i] = n[i])
                }
                return e
            }

            function a(e) {
                for (var t = {
                    x: e.offsetLeft,
                    y: e.offsetTop
                }; e = e.offsetParent;) t.x += e.offsetLeft,
                    t.y += e.offsetTop;
                return t
            }

            function s(e) {
                return void 0 === this ? new s(e) : void (this.opts = r(e || {},
                    s.defaults, f))
            }

            function l() {
                function n(t, n) {
                    return e("<" + t + ' xmlns="urn:schemas-microsoft.com:vml" class="spin-vml">', n)
                }

                p.addRule(".spin-vml", "behavior:url(#default#VML)"),
                    s.prototype.lines = function (e, i) {
                        function r() {
                            return o(n("group", {
                                coordsize: c + " " + c,
                                coordorigin: -l + " " + -l
                            }), {
                                width: c,
                                height: c
                            })
                        }

                        function a(e, a, s) {
                            t(d, t(o(r(), {
                                rotation: 360 / i.lines * e + "deg",
                                left: ~~a
                            }), t(o(n("roundrect", {
                                arcsize: i.corners
                            }), {
                                width: l,
                                height: i.width,
                                left: i.radius,
                                top: -i.width >> 1,
                                filter: s
                            }), n("fill", {
                                color: i.color,
                                opacity: i.opacity
                            }), n("stroke", {
                                opacity: 0
                            }))))
                        }

                        var s, l = i.length + i.width,
                            c = 2 * l,
                            u = 2 * -(i.width + i.length) + "px",
                            d = o(r(), {
                                position: "absolute",
                                top: u,
                                left: u
                            });
                        if (i.shadow) for (s = 1; i.lines >= s; s++) a(s, -2, "progid:DXImageTransform.Microsoft.Blur(pixelradius=2,makeshadow=1,shadowopacity=.3)");
                        for (s = 1; i.lines >= s; s++) a(s);
                        return t(e, d)
                    },
                    s.prototype.opacity = function (e, t, n, i) {
                        var o = e.firstChild;
                        i = i.shadow && i.lines || 0,
                        o && o.childNodes.length > t + i && (o = o.childNodes[t + i], o = o && o.firstChild, o = o && o.firstChild, o && (o.opacity = n))
                    }
            }

            var c, u = ["webkit", "Moz", "ms", "O"],
                d = {},
                p = function () {
                    var n = e("style", {
                        type: "text/css"
                    });
                    return t(document.getElementsByTagName("head")[0], n),
                    n.sheet || n.styleSheet
                }(),
                f = {
                    lines: 12,
                    length: 7,
                    width: 5,
                    radius: 10,
                    rotate: 0,
                    corners: 1,
                    color: "#000",
                    direction: 1,
                    speed: 1,
                    trail: 100,
                    opacity: .25,
                    fps: 20,
                    zIndex: 2e9,
                    className: "spinner",
                    top: "auto",
                    left: "auto",
                    position: "relative"
                };
            s.defaults = {},
                r(s.prototype, {
                    spin: function (t) {
                        this.stop();
                        var n, i, r = this,
                            s = r.opts,
                            l = r.el = o(e(0, {
                                className: s.className
                            }), {
                                position: s.position,
                                width: 0,
                                zIndex: s.zIndex
                            }),
                            u = s.radius + s.length + s.width;
                        if (t && (t.insertBefore(l, t.firstChild || null), i = a(t), n = a(l), o(l, {
                                left: ("auto" == s.left ? i.x - n.x + (t.offsetWidth >> 1) : parseInt(s.left, 10) + u) + "px",
                                top: ("auto" == s.top ? i.y - n.y + (t.offsetHeight >> 1) : parseInt(s.top, 10) + u) + "px"
                            })), l.setAttribute("role", "progressbar"), r.lines(l, r.opts), !c) {
                            var d, p = 0,
                                f = (s.lines - 1) * (1 - s.direction) / 2,
                                h = s.fps,
                                m = h / s.speed,
                                g = (1 - s.opacity) / (m * s.trail / 100),
                                v = m / s.lines;
                            !
                                function y() {
                                    p++;
                                    for (var e = 0; s.lines > e; e++) d = Math.max(1 - (p + (s.lines - e) * v) % m * g, s.opacity),
                                        r.opacity(l, e * s.direction + f, d, s);
                                    r.timeout = r.el && setTimeout(y, ~~(1e3 / h))
                                }()
                        }
                        return r
                    },
                    stop: function () {
                        var e = this.el;
                        return e && (clearTimeout(this.timeout), e.parentNode && e.parentNode.removeChild(e), this.el = void 0),
                            this
                    },
                    lines: function (i, r) {
                        function a(t, n) {
                            return o(e(), {
                                position: "absolute",
                                width: r.length + r.width + "px",
                                height: r.width + "px",
                                background: t,
                                boxShadow: n,
                                transformOrigin: "left",
                                transform: "rotate(" + ~~(360 / r.lines * l + r.rotate) + "deg) translate(" + r.radius + "px,0)",
                                borderRadius: (r.corners * r.width >> 1) + "px"
                            })
                        }

                        for (var s, l = 0,
                                 u = (r.lines - 1) * (1 - r.direction) / 2; r.lines > l; l++) s = o(e(), {
                            position: "absolute",
                            top: 1 + ~(r.width / 2) + "px",
                            transform: r.hwaccel ? "translate3d(0,0,0)" : "",
                            opacity: r.opacity,
                            animation: c && n(r.opacity, r.trail, u + l * r.direction, r.lines) + " " + 1 / r.speed + "s linear infinite"
                        }),
                        r.shadow && t(s, o(a("#000", "0 0 4px #000"), {
                            top: "2px"
                        })),
                            t(i, t(s, a(r.color, "0 0 1px rgba(0,0,0,.1)")));
                        return i
                    },
                    opacity: function (e, t, n) {
                        e.childNodes.length > t && (e.childNodes[t].style.opacity = n)
                    }
                });
            var h = o(e("group"), {
                behavior: "url(#default#VML)"
            });
            return !i(h, "transform") && h.adj ? l() : c = i(h, "animation"),
                s
        }),function (e, t) {
        "object" == typeof exports ? module.exports = t() : "function" == typeof define && define.amd ? define(["spin"], t) : e.Ladda = t(e.Spinner)
    }(this,function (e) {
            "use strict";

            function t(e) {
                if (void 0 === e) return void console.warn("Ladda button target must be defined.");
                e.querySelector(".ladda-label") || (e.innerHTML = '<span class="ladda-label">' + e.innerHTML + "</span>");
                var t = o(e),
                    n = document.createElement("span");
                n.className = "ladda-spinner",
                    e.appendChild(n);
                var i, r = {
                    start: function () {
                        return e.setAttribute("disabled", ""),
                            e.setAttribute("data-loading", ""),
                            clearTimeout(i),
                            t.spin(n),
                            this.setProgress(0),
                            this
                    },
                    startAfter: function (e) {
                        return clearTimeout(i),
                            i = setTimeout(function () {
                                    r.start()
                                },
                                e),
                            this
                    },
                    stop: function () {
                        return e.removeAttribute("disabled"),
                            e.removeAttribute("data-loading"),
                            clearTimeout(i),
                            i = setTimeout(function () {
                                    t.stop()
                                },
                                1e3),
                            this
                    },
                    toggle: function () {
                        return this.isLoading() ? this.stop() : this.start(),
                            this
                    },
                    setProgress: function (t) {
                        t = Math.max(Math.min(t, 1), 0);
                        var n = e.querySelector(".ladda-progress");
                        0 === t && n && n.parentNode ? n.parentNode.removeChild(n) : (n || (n = document.createElement("div"), n.className = "ladda-progress", e.appendChild(n)), n.style.width = (t || 0) * e.offsetWidth + "px")
                    },
                    enable: function () {
                        return this.stop(),
                            this
                    },
                    disable: function () {
                        return this.stop(),
                            e.setAttribute("disabled", ""),
                            this
                    },
                    isLoading: function () {
                        return e.hasAttribute("data-loading")
                    }
                };
                return a.push(r),
                    r
            }

            function n(e, n) {
                n = n || {};
                var i = [];
                "string" == typeof e ? i = r(document.querySelectorAll(e)) : "object" == typeof e && "string" == typeof e.nodeName && (i = [e]);
                for (var o = 0,
                         a = i.length; a > o; o++) (function () {
                    var e = i[o];
                    if ("function" == typeof e.addEventListener) {
                        var r = t(e),
                            a = -1;
                        e.addEventListener("click",
                            function () {
                                r.startAfter(1),
                                "number" == typeof n.timeout && (clearTimeout(a), a = setTimeout(r.stop, n.timeout)),
                                "function" == typeof n.callback && n.callback.apply(null, [r])
                            },
                            !1)
                    }
                })()
            }

            function i() {
                for (var e = 0,
                         t = a.length; t > e; e++) a[e].stop()
            }

            function o(t) {
                var n, i = t.offsetHeight;
                i > 32 && (i *= .8),
                t.hasAttribute("data-spinner-size") && (i = parseInt(t.getAttribute("data-spinner-size"), 10)),
                t.hasAttribute("data-spinner-color") && (n = t.getAttribute("data-spinner-color"));
                var o = 12,
                    r = .2 * i,
                    a = .6 * r,
                    s = 7 > r ? 2 : 3;
                return new e({
                    color: n || "#fff",
                    lines: o,
                    radius: r,
                    length: a,
                    width: s,
                    zIndex: "auto",
                    top: "auto",
                    left: "auto",
                    className: ""
                })
            }

            function r(e) {
                for (var t = [], n = 0; e.length > n; n++) t.push(e[n]);
                return t
            }

            var a = [];
            return {
                bind: n,
                create: t,
                stopAll: i
            }
        }),!function (e) {
            "function" == typeof define && define.amd ? define(["jquery"], e) : "object" == typeof exports ? module.exports = e : e(jQuery)
        }(function (e) {
            function t(t) {
                var a = t || window.event,
                    s = l.call(arguments, 1),
                    c = 0,
                    d = 0,
                    p = 0,
                    f = 0,
                    h = 0,
                    m = 0;
                if (t = e.event.fix(a), t.type = "mousewheel", "detail" in a && (p = -1 * a.detail), "wheelDelta" in a && (p = a.wheelDelta), "wheelDeltaY" in a && (p = a.wheelDeltaY), "wheelDeltaX" in a && (d = -1 * a.wheelDeltaX), "axis" in a && a.axis === a.HORIZONTAL_AXIS && (d = -1 * p, p = 0), c = 0 === p ? d : p, "deltaY" in a && (p = -1 * a.deltaY, c = p), "deltaX" in a && (d = a.deltaX, 0 === p && (c = -1 * d)), 0 !== p || 0 !== d) {
                    if (1 === a.deltaMode) {
                        var g = e.data(this, "mousewheel-line-height");
                        c *= g,
                            p *= g,
                            d *= g
                    } else if (2 === a.deltaMode) {
                        var v = e.data(this, "mousewheel-page-height");
                        c *= v,
                            p *= v,
                            d *= v
                    }
                    if (f = Math.max(Math.abs(p), Math.abs(d)), (!r || r > f) && (r = f, i(a, f) && (r /= 40)), i(a, f) && (c /= 40, d /= 40, p /= 40), c = Math[c >= 1 ? "floor" : "ceil"](c / r), d = Math[d >= 1 ? "floor" : "ceil"](d / r), p = Math[p >= 1 ? "floor" : "ceil"](p / r), u.settings.normalizeOffset && this.getBoundingClientRect) {
                        var y = this.getBoundingClientRect();
                        h = t.clientX - y.left,
                            m = t.clientY - y.top
                    }
                    return t.deltaX = d,
                        t.deltaY = p,
                        t.deltaFactor = r,
                        t.offsetX = h,
                        t.offsetY = m,
                        t.deltaMode = 0,
                        s.unshift(t, c, d, p),
                    o && clearTimeout(o),
                        o = setTimeout(n, 200),
                        (e.event.dispatch || e.event.handle).apply(this, s)
                }
            }

            function n() {
                r = null
            }

            function i(e, t) {
                return u.settings.adjustOldDeltas && "mousewheel" === e.type && t % 120 === 0
            }

            var o, r, a = ["wheel", "mousewheel", "DOMMouseScroll", "MozMousePixelScroll"],
                s = "onwheel" in document || document.documentMode >= 9 ? ["wheel"] : ["mousewheel", "DomMouseScroll", "MozMousePixelScroll"],
                l = Array.prototype.slice;
            if (e.event.fixHooks) for (var c = a.length; c;) e.event.fixHooks[a[--c]] = e.event.mouseHooks;
            var u = e.event.special.mousewheel = {
                version: "3.1.12",
                setup: function () {
                    if (this.addEventListener) for (var n = s.length; n;) this.addEventListener(s[--n], t, !1);
                    else this.onmousewheel = t;
                    e.data(this, "mousewheel-line-height", u.getLineHeight(this)),
                        e.data(this, "mousewheel-page-height", u.getPageHeight(this))
                },
                teardown: function () {
                    if (this.removeEventListener) for (var n = s.length; n;) this.removeEventListener(s[--n], t, !1);
                    else this.onmousewheel = null;
                    e.removeData(this, "mousewheel-line-height"),
                        e.removeData(this, "mousewheel-page-height")
                },
                getLineHeight: function (t) {
                    var n = e(t),
                        i = n["offsetParent" in e.fn ? "offsetParent" : "parent"]();
                    return i.length || (i = e("body")),
                    parseInt(i.css("fontSize"), 10) || parseInt(n.css("fontSize"), 10) || 16
                },
                getPageHeight: function (t) {
                    return e(t).height()
                },
                settings: {
                    adjustOldDeltas: !0,
                    normalizeOffset: !0
                }
            };
            e.fn.extend({
                mousewheel: function (e) {
                    return e ? this.bind("mousewheel", e) : this.trigger("mousewheel")
                },
                unmousewheel: function (e) {
                    return this.unbind("mousewheel", e)
                }
            })
        });
var Stats = function () {
    var e = Date.now(),
        t = e,
        n = 0,
        i = 1 / 0,
        o = 0,
        r = 0,
        a = 1 / 0,
        s = 0,
        l = 0,
        c = 0,
        u = document.createElement("div");
    u.id = "stats",
        u.addEventListener("mousedown",
            function (e) {
                e.preventDefault(),
                    y(++c % 2)
            },
            !1),
        u.style.cssText = "width:80px;opacity:0.9;cursor:pointer";
    var d = document.createElement("div");
    d.id = "fps",
        d.style.cssText = "padding:0 0 3px 3px;text-align:left;background-color:#002",
        u.appendChild(d);
    var p = document.createElement("div");
    p.id = "fpsText",
        p.style.cssText = "color:#0ff;font-family:Helvetica,Arial,sans-serif;font-size:9px;font-weight:bold;line-height:15px",
        p.innerHTML = "FPS",
        d.appendChild(p);
    var f = document.createElement("div");
    for (f.id = "fpsGraph", f.style.cssText = "position:relative;width:74px;height:30px;background-color:#0ff", d.appendChild(f); 74 > f.children.length;) {
        var h = document.createElement("span");
        h.style.cssText = "width:1px;height:30px;float:left;background-color:#113",
            f.appendChild(h)
    }
    var m = document.createElement("div");
    m.id = "ms",
        m.style.cssText = "padding:0 0 3px 3px;text-align:left;background-color:#020;display:none",
        u.appendChild(m);
    var g = document.createElement("div");
    g.id = "msText",
        g.style.cssText = "color:#0f0;font-family:Helvetica,Arial,sans-serif;font-size:9px;font-weight:bold;line-height:15px",
        g.innerHTML = "MS",
        m.appendChild(g);
    var v = document.createElement("div");
    for (v.id = "msGraph", v.style.cssText = "position:relative;width:74px;height:30px;background-color:#0f0", m.appendChild(v); 74 > v.children.length;) h = document.createElement("span"),
        h.style.cssText = "width:1px;height:30px;float:left;background-color:#131",
        v.appendChild(h);
    var y = function (e) {
        switch (c = e) {
            case 0:
                d.style.display = "block",
                    m.style.display = "none";
                break;
            case 1:
                d.style.display = "none",
                    m.style.display = "block"
        }
    };
    return {
        REVISION: 12,
        domElement: u,
        setMode: y,
        begin: function () {
            e = Date.now()
        },
        end: function () {
            var c = Date.now();
            n = c - e,
                i = Math.min(i, n),
                o = Math.max(o, n),
                g.textContent = n + " MS (" + i + "-" + o + ")";
            var u = Math.min(30, 30 - 30 * (n / 200));
            return v.appendChild(v.firstChild).style.height = u + "px",
                l++,
            c > t + 1e3 && (r = Math.round(1e3 * l / (c - t)), a = Math.min(a, r), s = Math.max(s, r), p.textContent = r + " FPS (" + a + "-" + s + ")", u = Math.min(30, 30 - 30 * (r / 100)), f.appendChild(f.firstChild).style.height = u + "px", t = c, l = 0),
                c
        },
        update: function () {
            e = this.end()
        }
    }
};
"object" == typeof module && (module.exports = Stats),
    !function (e) {
            "function" == typeof define && define.amd ? define(["jquery"], e) : e("object" == typeof exports ? require("jquery") : window.jQuery || window.Zepto)
        }(function (e) {
            var t, n, i, o, r, a, s = "Close",
                l = "BeforeClose",
                c = "AfterClose",
                u = "BeforeAppend",
                d = "MarkupParse",
                p = "Open",
                f = "Change",
                h = "mfp",
                m = "." + h,
                g = "mfp-ready",
                v = "mfp-removing",
                y = "mfp-prevent-close",
                w = function () {
                },
                b = !!window.jQuery,
                x = e(window),
                S = function (e, n) {
                    t.ev.on(h + e + m, n)
                },
                C = function (t, n, i, o) {
                    var r = document.createElement("div");
                    return r.className = "mfp-" + t,
                    i && (r.innerHTML = i),
                        o ? n && n.appendChild(r) : (r = e(r), n && r.appendTo(n)),
                        r
                },
                T = function (n, i) {
                    t.ev.triggerHandler(h + n, i),
                    t.st.callbacks && (n = n.charAt(0).toLowerCase() + n.slice(1), t.st.callbacks[n] && t.st.callbacks[n].apply(t, e.isArray(i) ? i : [i]))
                },
                E = function (n) {
                    return n === a && t.currTemplate.closeBtn || (t.currTemplate.closeBtn = e(t.st.closeMarkup.replace("%title%", t.st.tClose)), a = n),
                        t.currTemplate.closeBtn
                },
                _ = function () {
                    e.magnificPopup.instance || (t = new w, t.init(), e.magnificPopup.instance = t)
                },
                I = function () {
                    var e = document.createElement("p").style,
                        t = ["ms", "O", "Moz", "Webkit"];
                    if (void 0 !== e.transition) return !0;
                    for (; t.length;) if (t.pop() + "Transition" in e) return !0;
                    return !1
                };
            w.prototype = {
                constructor: w,
                init: function () {
                    var n = navigator.appVersion;
                    t.isIE7 = -1 !== n.indexOf("MSIE 7."),
                        t.isIE8 = -1 !== n.indexOf("MSIE 8."),
                        t.isLowIE = t.isIE7 || t.isIE8,
                        t.isAndroid = /android/gi.test(n),
                        t.isIOS = /iphone|ipad|ipod/gi.test(n),
                        t.supportsTransition = I(),
                        t.probablyMobile = t.isAndroid || t.isIOS || /(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(navigator.userAgent),
                        i = e(document),
                        t.popupsCache = {}
                },
                open: function (n) {
                    var o;
                    if (n.isObj === !1) {
                        t.items = n.items.toArray(),
                            t.index = 0;
                        var a, s = n.items;
                        for (o = 0; o < s.length; o++) if (a = s[o], a.parsed && (a = a.el[0]), a === n.el[0]) {
                            t.index = o;
                            break
                        }
                    } else t.items = e.isArray(n.items) ? n.items : [n.items],
                        t.index = n.index || 0;
                    if (t.isOpen) return void t.updateItemHTML();
                    t.types = [],
                        r = "",
                        t.ev = n.mainEl && n.mainEl.length ? n.mainEl.eq(0) : i,
                        n.key ? (t.popupsCache[n.key] || (t.popupsCache[n.key] = {}), t.currTemplate = t.popupsCache[n.key]) : t.currTemplate = {},
                        t.st = e.extend(!0, {},
                            e.magnificPopup.defaults, n),
                        t.fixedContentPos = "auto" === t.st.fixedContentPos ? !t.probablyMobile : t.st.fixedContentPos,
                    t.st.modal && (t.st.closeOnContentClick = !1, t.st.closeOnBgClick = !1, t.st.showCloseBtn = !1, t.st.enableEscapeKey = !1),
                    t.bgOverlay || (t.bgOverlay = C("bg").on("click" + m,
                        function () {
                            t.close()
                        }), t.wrap = C("wrap").attr("tabindex", -1).on("click" + m,
                        function (e) {
                            t._checkIfClose(e.target) && t.close()
                        }), t.container = C("container", t.wrap)),
                        t.contentContainer = C("content"),
                    t.st.preloader && (t.preloader = C("preloader", t.container, t.st.tLoading));
                    var l = e.magnificPopup.modules;
                    for (o = 0; o < l.length; o++) {
                        var c = l[o];
                        c = c.charAt(0).toUpperCase() + c.slice(1),
                            t["init" + c].call(t)
                    }
                    T("BeforeOpen"),
                    t.st.showCloseBtn && (t.st.closeBtnInside ? (S(d,
                        function (e, t, n, i) {
                            n.close_replaceWith = E(i.type)
                        }), r += " mfp-close-btn-in") : t.wrap.append(E())),
                    t.st.alignTop && (r += " mfp-align-top"),
                        t.wrap.css(t.fixedContentPos ? {
                            overflow: t.st.overflowY,
                            overflowX: "hidden",
                            overflowY: t.st.overflowY
                        } : {
                            top: x.scrollTop(),
                            position: "absolute"
                        }),
                    (t.st.fixedBgPos === !1 || "auto" === t.st.fixedBgPos && !t.fixedContentPos) && t.bgOverlay.css({
                        height: i.height(),
                        position: "absolute"
                    }),
                    t.st.enableEscapeKey && i.on("keyup" + m,
                        function (e) {
                            27 === e.keyCode && t.close()
                        }),
                        x.on("resize" + m,
                            function () {
                                t.updateSize()
                            }),
                    t.st.closeOnContentClick || (r += " mfp-auto-cursor"),
                    r && t.wrap.addClass(r);
                    var u = t.wH = x.height(),
                        f = {};
                    if (t.fixedContentPos && t._hasScrollBar(u)) {
                        var h = t._getScrollbarSize();
                        h && (f.marginRight = h)
                    }
                    t.fixedContentPos && (t.isIE7 ? e("body, html").css("overflow", "hidden") : f.overflow = "hidden");
                    var v = t.st.mainClass;
                    return t.isIE7 && (v += " mfp-ie7"),
                    v && t._addClassToMFP(v),
                        t.updateItemHTML(),
                        T("BuildControls"),
                        e("html").css(f),
                        t.bgOverlay.add(t.wrap).prependTo(t.st.prependTo || e(document.body)),
                        t._lastFocusedEl = document.activeElement,
                        setTimeout(function () {
                                t.content ? (t._addClassToMFP(g), t._setFocus()) : t.bgOverlay.addClass(g),
                                    i.on("focusin" + m, t._onFocusIn)
                            },
                            16),
                        t.isOpen = !0,
                        t.updateSize(u),
                        T(p),
                        n
                },
                close: function () {
                    t.isOpen && (T(l), t.isOpen = !1, t.st.removalDelay && !t.isLowIE && t.supportsTransition ? (t._addClassToMFP(v), setTimeout(function () {
                            t._close()
                        },
                        t.st.removalDelay)) : t._close())
                },
                _close: function () {
                    T(s);
                    var n = v + " " + g + " ";
                    if (t.bgOverlay.detach(), t.wrap.detach(), t.container.empty(), t.st.mainClass && (n += t.st.mainClass + " "), t._removeClassFromMFP(n), t.fixedContentPos) {
                        var o = {
                            marginRight: ""
                        };
                        t.isIE7 ? e("body, html").css("overflow", "") : o.overflow = "",
                            e("html").css(o)
                    }
                    i.off("keyup" + m + " focusin" + m),
                        t.ev.off(m),
                        t.wrap.attr("class", "mfp-wrap").removeAttr("style"),
                        t.bgOverlay.attr("class", "mfp-bg"),
                        t.container.attr("class", "mfp-container"),
                    !t.st.showCloseBtn || t.st.closeBtnInside && t.currTemplate[t.currItem.type] !== !0 || t.currTemplate.closeBtn && t.currTemplate.closeBtn.detach(),
                    t._lastFocusedEl && e(t._lastFocusedEl).focus(),
                        t.currItem = null,
                        t.content = null,
                        t.currTemplate = null,
                        t.prevHeight = 0,
                        T(c)
                },
                updateSize: function (e) {
                    if (t.isIOS) {
                        var n = document.documentElement.clientWidth / window.innerWidth,
                            i = window.innerHeight * n;
                        t.wrap.css("height", i),
                            t.wH = i
                    } else t.wH = e || x.height();
                    t.fixedContentPos || t.wrap.css("height", t.wH),
                        T("Resize")
                },
                updateItemHTML: function () {
                    var n = t.items[t.index];
                    t.contentContainer.detach(),
                    t.content && t.content.detach(),
                    n.parsed || (n = t.parseEl(t.index));
                    var i = n.type;
                    if (T("BeforeChange", [t.currItem ? t.currItem.type : "", i]), t.currItem = n, !t.currTemplate[i]) {
                        var r = t.st[i] ? t.st[i].markup : !1;
                        T("FirstMarkupParse", r),
                            t.currTemplate[i] = r ? e(r) : !0
                    }
                    o && o !== n.type && t.container.removeClass("mfp-" + o + "-holder");
                    var a = t["get" + i.charAt(0).toUpperCase() + i.slice(1)](n, t.currTemplate[i]);
                    t.appendContent(a, i),
                        n.preloaded = !0,
                        T(f, n),
                        o = n.type,
                        t.container.prepend(t.contentContainer),
                        T("AfterChange")
                },
                appendContent: function (e, n) {
                    t.content = e,
                        e ? t.st.showCloseBtn && t.st.closeBtnInside && t.currTemplate[n] === !0 ? t.content.find(".mfp-close").length || t.content.append(E()) : t.content = e : t.content = "",
                        T(u),
                        t.container.addClass("mfp-" + n + "-holder"),
                        t.contentContainer.append(t.content)
                },
                parseEl: function (n) {
                    var i, o = t.items[n];
                    if (o.tagName ? o = {
                            el: e(o)
                        } : (i = o.type, o = {
                            data: o,
                            src: o.src
                        }), o.el) {
                        for (var r = t.types,
                                 a = 0; a < r.length; a++) if (o.el.hasClass("mfp-" + r[a])) {
                            i = r[a];
                            break
                        }
                        o.src = o.el.attr("data-mfp-src"),
                        o.src || (o.src = o.el.attr("href"))
                    }
                    return o.type = i || t.st.type || "inline",
                        o.index = n,
                        o.parsed = !0,
                        t.items[n] = o,
                        T("ElementParse", o),
                        t.items[n]
                },
                addGroup: function (e, n) {
                    var i = function (i) {
                        i.mfpEl = this,
                            t._openClick(i, e, n)
                    };
                    n || (n = {});
                    var o = "click.magnificPopup";
                    n.mainEl = e,
                        n.items ? (n.isObj = !0, e.off(o).on(o, i)) : (n.isObj = !1, n.delegate ? e.off(o).on(o, n.delegate, i) : (n.items = e, e.off(o).on(o, i)))
                },
                _openClick: function (n, i, o) {
                    var r = void 0 !== o.midClick ? o.midClick : e.magnificPopup.defaults.midClick;
                    if (r || 2 !== n.which && !n.ctrlKey && !n.metaKey) {
                        var a = void 0 !== o.disableOn ? o.disableOn : e.magnificPopup.defaults.disableOn;
                        if (a) if (e.isFunction(a)) {
                            if (!a.call(t)) return !0
                        } else if (x.width() < a) return !0;
                        n.type && (n.preventDefault(), t.isOpen && n.stopPropagation()),
                            o.el = e(n.mfpEl),
                        o.delegate && (o.items = i.find(o.delegate)),
                            t.open(o)
                    }
                },
                updateStatus: function (e, i) {
                    if (t.preloader) {
                        n !== e && t.container.removeClass("mfp-s-" + n),
                        i || "loading" !== e || (i = t.st.tLoading);
                        var o = {
                            status: e,
                            text: i
                        };
                        T("UpdateStatus", o),
                            e = o.status,
                            i = o.text,
                            t.preloader.html(i),
                            t.preloader.find("a").on("click",
                                function (e) {
                                    e.stopImmediatePropagation()
                                }),
                            t.container.addClass("mfp-s-" + e),
                            n = e
                    }
                },
                _checkIfClose: function (n) {
                    if (!e(n).hasClass(y)) {
                        var i = t.st.closeOnContentClick,
                            o = t.st.closeOnBgClick;
                        if (i && o) return !0;
                        if (!t.content || e(n).hasClass("mfp-close") || t.preloader && n === t.preloader[0]) return !0;
                        if (n === t.content[0] || e.contains(t.content[0], n)) {
                            if (i) return !0
                        } else if (o && e.contains(document, n)) return !0;
                        return !1
                    }
                },
                _addClassToMFP: function (e) {
                    t.bgOverlay.addClass(e),
                        t.wrap.addClass(e)
                },
                _removeClassFromMFP: function (e) {
                    this.bgOverlay.removeClass(e),
                        t.wrap.removeClass(e)
                },
                _hasScrollBar: function (e) {
                    return (t.isIE7 ? i.height() : document.body.scrollHeight) > (e || x.height())
                },
                _setFocus: function () {
                    (t.st.focus ? t.content.find(t.st.focus).eq(0) : t.wrap).focus()
                },
                _onFocusIn: function (n) {
                    return n.target === t.wrap[0] || e.contains(t.wrap[0], n.target) ? void 0 : (t._setFocus(), !1)
                },
                _parseMarkup: function (t, n, i) {
                    var o;
                    i.data && (n = e.extend(i.data, n)),
                        T(d, [t, n, i]),
                        e.each(n,
                            function (e, n) {
                                if (void 0 === n || n === !1) return !0;
                                if (o = e.split("_"), o.length > 1) {
                                    var i = t.find(m + "-" + o[0]);
                                    if (i.length > 0) {
                                        var r = o[1];
                                        "replaceWith" === r ? i[0] !== n[0] && i.replaceWith(n) : "img" === r ? i.is("img") ? i.attr("src", n) : i.replaceWith('<img src="' + n + '" class="' + i.attr("class") + '" />') : i.attr(o[1], n)
                                    }
                                } else t.find(m + "-" + e).html(n)
                            })
                },
                _getScrollbarSize: function () {
                    if (void 0 === t.scrollbarSize) {
                        var e = document.createElement("div");
                        e.style.cssText = "width: 99px; height: 99px; overflow: scroll; position: absolute; top: -9999px;",
                            document.body.appendChild(e),
                            t.scrollbarSize = e.offsetWidth - e.clientWidth,
                            document.body.removeChild(e)
                    }
                    return t.scrollbarSize
                }
            },
                e.magnificPopup = {
                    instance: null,
                    proto: w.prototype,
                    modules: [],
                    open: function (t, n) {
                        return _(),
                            t = t ? e.extend(!0, {},
                                t) : {},
                            t.isObj = !0,
                            t.index = n || 0,
                            this.instance.open(t)
                    },
                    close: function () {
                        return e.magnificPopup.instance && e.magnificPopup.instance.close()
                    },
                    registerModule: function (t, n) {
                        n.options && (e.magnificPopup.defaults[t] = n.options),
                            e.extend(this.proto, n.proto),
                            this.modules.push(t)
                    },
                    defaults: {
                        disableOn: 0,
                        key: null,
                        midClick: !1,
                        mainClass: "",
                        preloader: !0,
                        focus: "",
                        closeOnContentClick: !1,
                        closeOnBgClick: !0,
                        closeBtnInside: !0,
                        showCloseBtn: !0,
                        enableEscapeKey: !0,
                        modal: !1,
                        alignTop: !1,
                        removalDelay: 0,
                        prependTo: null,
                        fixedContentPos: "auto",
                        fixedBgPos: "auto",
                        overflowY: "auto",
                        closeMarkup: '<button title="%title%" type="button" class="mfp-close">&times;</button>',
                        tClose: "Close (Esc)",
                        tLoading: "Loading..."
                    }
                },
                e.fn.magnificPopup = function (n) {
                    _();
                    var i = e(this);
                    if ("string" == typeof n) if ("open" === n) {
                        var o, r = b ? i.data("magnificPopup") : i[0].magnificPopup,
                            a = parseInt(arguments[1], 10) || 0;
                        r.items ? o = r.items[a] : (o = i, r.delegate && (o = o.find(r.delegate)), o = o.eq(a)),
                            t._openClick({
                                    mfpEl: o
                                },
                                i, r)
                    } else t.isOpen && t[n].apply(t, Array.prototype.slice.call(arguments, 1));
                    else n = e.extend(!0, {},
                        n),
                        b ? i.data("magnificPopup", n) : i[0].magnificPopup = n,
                        t.addGroup(i, n);
                    return i
                };
            var P, k, M, H = "inline",
                O = function () {
                    M && (k.after(M.addClass(P)).detach(), M = null)
                };
            e.magnificPopup.registerModule(H, {
                options: {
                    hiddenClass: "hide",
                    markup: "",
                    tNotFound: "Content not found"
                },
                proto: {
                    initInline: function () {
                        t.types.push(H),
                            S(s + "." + H,
                                function () {
                                    O()
                                })
                    },
                    getInline: function (n, i) {
                        if (O(), n.src) {
                            var o = t.st.inline,
                                r = e(n.src);
                            if (r.length) {
                                var a = r[0].parentNode;
                                a && a.tagName && (k || (P = o.hiddenClass, k = C(P), P = "mfp-" + P), M = r.after(k).detach().removeClass(P)),
                                    t.updateStatus("ready")
                            } else t.updateStatus("error", o.tNotFound),
                                r = e("<div>");
                            return n.inlineElement = r,
                                r
                        }
                        return t.updateStatus("ready"),
                            t._parseMarkup(i, {},
                                n),
                            i
                    }
                }
            });
            var B, L = "ajax",
                A = function () {
                    B && e(document.body).removeClass(B)
                },
                $ = function () {
                    A(),
                    t.req && t.req.abort()
                };
            e.magnificPopup.registerModule(L, {
                options: {
                    settings: null,
                    cursor: "mfp-ajax-cur",
                    tError: '<a href="%url%">The content</a> could not be loaded.'
                },
                proto: {
                    initAjax: function () {
                        t.types.push(L),
                            B = t.st.ajax.cursor,
                            S(s + "." + L, $),
                            S("BeforeChange." + L, $)
                    },
                    getAjax: function (n) {
                        B && e(document.body).addClass(B),
                            t.updateStatus("loading");
                        var i = e.extend({
                                url: n.src,
                                success: function (i, o, r) {
                                    var a = {
                                        data: i,
                                        xhr: r
                                    };
                                    T("ParseAjax", a),
                                        t.appendContent(e(a.data), L),
                                        n.finished = !0,
                                        A(),
                                        t._setFocus(),
                                        setTimeout(function () {
                                                t.wrap.addClass(g)
                                            },
                                            16),
                                        t.updateStatus("ready"),
                                        T("AjaxContentAdded")
                                },
                                error: function () {
                                    A(),
                                        n.finished = n.loadError = !0,
                                        t.updateStatus("error", t.st.ajax.tError.replace("%url%", n.src))
                                }
                            },
                            t.st.ajax.settings);
                        return t.req = e.ajax(i),
                            ""
                    }
                }
            });
            var j, z = function (n) {
                if (n.data && void 0 !== n.data.title) return n.data.title;
                var i = t.st.image.titleSrc;
                if (i) {
                    if (e.isFunction(i)) return i.call(t, n);
                    if (n.el) return n.el.attr(i) || ""
                }
                return ""
            };
            e.magnificPopup.registerModule("image", {
                options: {
                    markup: '<div class="mfp-figure"><div class="mfp-close"></div><figure><div class="mfp-img"></div><figcaption><div class="mfp-bottom-bar"><div class="mfp-title"></div><div class="mfp-counter"></div></div></figcaption></figure></div>',
                    cursor: "mfp-zoom-out-cur",
                    titleSrc: "title",
                    verticalFit: !0,
                    tError: '<a href="%url%">The image</a> could not be loaded.'
                },
                proto: {
                    initImage: function () {
                        var n = t.st.image,
                            i = ".image";
                        t.types.push("image"),
                            S(p + i,
                                function () {
                                    "image" === t.currItem.type && n.cursor && e(document.body).addClass(n.cursor)
                                }),
                            S(s + i,
                                function () {
                                    n.cursor && e(document.body).removeClass(n.cursor),
                                        x.off("resize" + m)
                                }),
                            S("Resize" + i, t.resizeImage),
                        t.isLowIE && S("AfterChange", t.resizeImage)
                    },
                    resizeImage: function () {
                        var e = t.currItem;
                        if (e && e.img && t.st.image.verticalFit) {
                            var n = 0;
                            t.isLowIE && (n = parseInt(e.img.css("padding-top"), 10) + parseInt(e.img.css("padding-bottom"), 10)),
                                e.img.css("max-height", t.wH - n)
                        }
                    },
                    _onImageHasSize: function (e) {
                        e.img && (e.hasSize = !0, j && clearInterval(j), e.isCheckingImgSize = !1, T("ImageHasSize", e), e.imgHidden && (t.content && t.content.removeClass("mfp-loading"), e.imgHidden = !1))
                    },
                    findImageSize: function (e) {
                        var n = 0,
                            i = e.img[0],
                            o = function (r) {
                                j && clearInterval(j),
                                    j = setInterval(function () {
                                            return i.naturalWidth > 0 ? void t._onImageHasSize(e) : (n > 200 && clearInterval(j), n++, void (3 === n ? o(10) : 40 === n ? o(50) : 100 === n && o(500)))
                                        },
                                        r)
                            };
                        o(1)
                    },
                    getImage: function (n, i) {
                        var o = 0,
                            r = function () {
                                n && (n.img[0].complete ? (n.img.off(".mfploader"), n === t.currItem && (t._onImageHasSize(n), t.updateStatus("ready")), n.hasSize = !0, n.loaded = !0, T("ImageLoadComplete")) : (o++, 200 > o ? setTimeout(r, 100) : a()))
                            },
                            a = function () {
                                n && (n.img.off(".mfploader"), n === t.currItem && (t._onImageHasSize(n), t.updateStatus("error", s.tError.replace("%url%", n.src))), n.hasSize = !0, n.loaded = !0, n.loadError = !0)
                            },
                            s = t.st.image,
                            l = i.find(".mfp-img");
                        if (l.length) {
                            var c = document.createElement("img");
                            c.className = "mfp-img",
                            n.el && n.el.find("img").length && (c.alt = n.el.find("img").attr("alt")),
                                n.img = e(c).on("load.mfploader", r).on("error.mfploader", a),
                                c.src = n.src,
                            l.is("img") && (n.img = n.img.clone()),
                                c = n.img[0],
                                c.naturalWidth > 0 ? n.hasSize = !0 : c.width || (n.hasSize = !1)
                        }
                        return t._parseMarkup(i, {
                                title: z(n),
                                img_replaceWith: n.img
                            },
                            n),
                            t.resizeImage(),
                            n.hasSize ? (j && clearInterval(j), n.loadError ? (i.addClass("mfp-loading"), t.updateStatus("error", s.tError.replace("%url%", n.src))) : (i.removeClass("mfp-loading"), t.updateStatus("ready")), i) : (t.updateStatus("loading"), n.loading = !0, n.hasSize || (n.imgHidden = !0, i.addClass("mfp-loading"), t.findImageSize(n)), i)
                    }
                }
            });
            var F, N = function () {
                return void 0 === F && (F = void 0 !== document.createElement("p").style.MozTransform),
                    F
            };
            e.magnificPopup.registerModule("zoom", {
                options: {
                    enabled: !1,
                    easing: "ease-in-out",
                    duration: 300,
                    opener: function (e) {
                        return e.is("img") ? e : e.find("img")
                    }
                },
                proto: {
                    initZoom: function () {
                        var e, n = t.st.zoom,
                            i = ".zoom";
                        if (n.enabled && t.supportsTransition) {
                            var o, r, a = n.duration,
                                c = function (e) {
                                    var t = e.clone().removeAttr("style").removeAttr("class").addClass("mfp-animated-image"),
                                        i = "all " + n.duration / 1e3 + "s " + n.easing,
                                        o = {
                                            position: "fixed",
                                            zIndex: 9999,
                                            left: 0,
                                            top: 0,
                                            "-webkit-backface-visibility": "hidden"
                                        },
                                        r = "transition";
                                    return o["-webkit-" + r] = o["-moz-" + r] = o["-o-" + r] = o[r] = i,
                                        t.css(o),
                                        t
                                },
                                u = function () {
                                    t.content.css("visibility", "visible")
                                };
                            S("BuildControls" + i,
                                function () {
                                    if (t._allowZoom()) {
                                        if (clearTimeout(o), t.content.css("visibility", "hidden"), e = t._getItemToZoom(), !e) return void u();
                                        r = c(e),
                                            r.css(t._getOffset()),
                                            t.wrap.append(r),
                                            o = setTimeout(function () {
                                                    r.css(t._getOffset(!0)),
                                                        o = setTimeout(function () {
                                                                u(),
                                                                    setTimeout(function () {
                                                                            r.remove(),
                                                                                e = r = null,
                                                                                T("ZoomAnimationEnded")
                                                                        },
                                                                        16)
                                                            },
                                                            a)
                                                },
                                                16)
                                    }
                                }),
                                S(l + i,
                                    function () {
                                        if (t._allowZoom()) {
                                            if (clearTimeout(o), t.st.removalDelay = a, !e) {
                                                if (e = t._getItemToZoom(), !e) return;
                                                r = c(e)
                                            }
                                            r.css(t._getOffset(!0)),
                                                t.wrap.append(r),
                                                t.content.css("visibility", "hidden"),
                                                setTimeout(function () {
                                                        r.css(t._getOffset())
                                                    },
                                                    16)
                                        }
                                    }),
                                S(s + i,
                                    function () {
                                        t._allowZoom() && (u(), r && r.remove(), e = null)
                                    })
                        }
                    },
                    _allowZoom: function () {
                        return "image" === t.currItem.type
                    },
                    _getItemToZoom: function () {
                        return t.currItem.hasSize ? t.currItem.img : !1
                    },
                    _getOffset: function (n) {
                        var i;
                        i = n ? t.currItem.img : t.st.zoom.opener(t.currItem.el || t.currItem);
                        var o = i.offset(),
                            r = parseInt(i.css("padding-top"), 10),
                            a = parseInt(i.css("padding-bottom"), 10);
                        o.top -= e(window).scrollTop() - r;
                        var s = {
                            width: i.width(),
                            height: (b ? i.innerHeight() : i[0].offsetHeight) - a - r
                        };
                        return N() ? s["-moz-transform"] = s.transform = "translate(" + o.left + "px," + o.top + "px)" : (s.left = o.left, s.top = o.top),
                            s
                    }
                }
            });
            var D = "iframe",
                U = "//about:blank",
                R = function (e) {
                    if (t.currTemplate[D]) {
                        var n = t.currTemplate[D].find("iframe");
                        n.length && (e || (n[0].src = U), t.isIE8 && n.css("display", e ? "block" : "none"))
                    }
                };
            e.magnificPopup.registerModule(D, {
                options: {
                    markup: '<div class="mfp-iframe-scaler"><div class="mfp-close"></div><iframe class="mfp-iframe" src="//about:blank" frameborder="0" allowfullscreen></iframe></div>',
                    srcAction: "iframe_src",
                    patterns: {
                        youtube: {
                            index: "youtube.com",
                            id: "v=",
                            src: "//www.youtube.com/embed/%id%?autoplay=1"
                        },
                        vimeo: {
                            index: "vimeo.com/",
                            id: "/",
                            src: "//player.vimeo.com/video/%id%?autoplay=1"
                        },
                        gmaps: {
                            index: "//maps.google.",
                            src: "%id%&output=embed"
                        }
                    }
                },
                proto: {
                    initIframe: function () {
                        t.types.push(D),
                            S("BeforeChange",
                                function (e, t, n) {
                                    t !== n && (t === D ? R() : n === D && R(!0))
                                }),
                            S(s + "." + D,
                                function () {
                                    R()
                                })
                    },
                    getIframe: function (n, i) {
                        var o = n.src,
                            r = t.st.iframe;
                        e.each(r.patterns,
                            function () {
                                return o.indexOf(this.index) > -1 ? (this.id && (o = "string" == typeof this.id ? o.substr(o.lastIndexOf(this.id) + this.id.length, o.length) : this.id.call(this, o)), o = this.src.replace("%id%", o), !1) : void 0
                            });
                        var a = {};
                        return r.srcAction && (a[r.srcAction] = o),
                            t._parseMarkup(i, a, n),
                            t.updateStatus("ready"),
                            i
                    }
                }
            });
            var V = function (e) {
                    var n = t.items.length;
                    return e > n - 1 ? e - n : 0 > e ? n + e : e
                },
                q = function (e, t, n) {
                    return e.replace(/%curr%/gi, t + 1).replace(/%total%/gi, n)
                };
            e.magnificPopup.registerModule("gallery", {
                options: {
                    enabled: !1,
                    arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
                    preload: [0, 2],
                    navigateByImgClick: !0,
                    arrows: !0,
                    tPrev: "Previous (Left arrow key)",
                    tNext: "Next (Right arrow key)",
                    tCounter: "%curr% of %total%"
                },
                proto: {
                    initGallery: function () {
                        var n = t.st.gallery,
                            o = ".mfp-gallery",
                            a = Boolean(e.fn.mfpFastClick);
                        return t.direction = !0,
                            n && n.enabled ? (r += " mfp-gallery", S(p + o,
                                function () {
                                    n.navigateByImgClick && t.wrap.on("click" + o, ".mfp-img",
                                        function () {
                                            return t.items.length > 1 ? (t.next(), !1) : void 0
                                        }),
                                        i.on("keydown" + o,
                                            function (e) {
                                                37 === e.keyCode ? t.prev() : 39 === e.keyCode && t.next()
                                            })
                                }), S("UpdateStatus" + o,
                                function (e, n) {
                                    n.text && (n.text = q(n.text, t.currItem.index, t.items.length))
                                }), S(d + o,
                                function (e, i, o, r) {
                                    var a = t.items.length;
                                    o.counter = a > 1 ? q(n.tCounter, r.index, a) : ""
                                }), S("BuildControls" + o,
                                function () {
                                    if (t.items.length > 1 && n.arrows && !t.arrowLeft) {
                                        var i = n.arrowMarkup,
                                            o = t.arrowLeft = e(i.replace(/%title%/gi, n.tPrev).replace(/%dir%/gi, "left")).addClass(y),
                                            r = t.arrowRight = e(i.replace(/%title%/gi, n.tNext).replace(/%dir%/gi, "right")).addClass(y),
                                            s = a ? "mfpFastClick" : "click";
                                        o[s](function () {
                                            t.prev()
                                        }),
                                            r[s](function () {
                                                t.next()
                                            }),
                                        t.isIE7 && (C("b", o[0], !1, !0), C("a", o[0], !1, !0), C("b", r[0], !1, !0), C("a", r[0], !1, !0)),
                                            t.container.append(o.add(r))
                                    }
                                }), S(f + o,
                                function () {
                                    t._preloadTimeout && clearTimeout(t._preloadTimeout),
                                        t._preloadTimeout = setTimeout(function () {
                                                t.preloadNearbyImages(),
                                                    t._preloadTimeout = null
                                            },
                                            16)
                                }), void S(s + o,
                                function () {
                                    i.off(o),
                                        t.wrap.off("click" + o),
                                    t.arrowLeft && a && t.arrowLeft.add(t.arrowRight).destroyMfpFastClick(),
                                        t.arrowRight = t.arrowLeft = null
                                })) : !1
                    },
                    next: function () {
                        t.direction = !0,
                            t.index = V(t.index + 1),
                            t.updateItemHTML()
                    },
                    prev: function () {
                        t.direction = !1,
                            t.index = V(t.index - 1),
                            t.updateItemHTML()
                    },
                    goTo: function (e) {
                        t.direction = e >= t.index,
                            t.index = e,
                            t.updateItemHTML()
                    },
                    preloadNearbyImages: function () {
                        var e, n = t.st.gallery.preload,
                            i = Math.min(n[0], t.items.length),
                            o = Math.min(n[1], t.items.length);
                        for (e = 1; e <= (t.direction ? o : i); e++) t._preloadItem(t.index + e);
                        for (e = 1; e <= (t.direction ? i : o); e++) t._preloadItem(t.index - e)
                    },
                    _preloadItem: function (n) {
                        if (n = V(n), !t.items[n].preloaded) {
                            var i = t.items[n];
                            i.parsed || (i = t.parseEl(n)),
                                T("LazyLoad", i),
                            "image" === i.type && (i.img = e('<img class="mfp-img" />').on("load.mfploader",
                                function () {
                                    i.hasSize = !0
                                }).on("error.mfploader",
                                function () {
                                    i.hasSize = !0,
                                        i.loadError = !0,
                                        T("LazyLoadError", i)
                                }).attr("src", i.src)),
                                i.preloaded = !0
                        }
                    }
                }
            });
            var Q = "retina";
            e.magnificPopup.registerModule(Q, {
                options: {
                    replaceSrc: function (e) {
                        return e.src.replace(/\.\w+$/,
                            function (e) {
                                return "@2x" + e
                            })
                    },
                    ratio: 1
                },
                proto: {
                    initRetina: function () {
                        if (window.devicePixelRatio > 1) {
                            var e = t.st.retina,
                                n = e.ratio;
                            n = isNaN(n) ? n() : n,
                            n > 1 && (S("ImageHasSize." + Q,
                                function (e, t) {
                                    t.img.css({
                                        "max-width": t.img[0].naturalWidth / n,
                                        width: "100%"
                                    })
                                }), S("ElementParse." + Q,
                                function (t, i) {
                                    i.src = e.replaceSrc(i, n)
                                }))
                        }
                    }
                }
            }),
                function () {
                    var t = 1e3,
                        n = "ontouchstart" in window,
                        i = function () {
                            x.off("touchmove" + r + " touchend" + r)
                        },
                        o = "mfpFastClick",
                        r = "." + o;
                    e.fn.mfpFastClick = function (o) {
                        return e(this).each(function () {
                            var a, s = e(this);
                            if (n) {
                                var l, c, u, d, p, f;
                                s.on("touchstart" + r,
                                    function (e) {
                                        d = !1,
                                            f = 1,
                                            p = e.originalEvent ? e.originalEvent.touches[0] : e.touches[0],
                                            c = p.clientX,
                                            u = p.clientY,
                                            x.on("touchmove" + r,
                                                function (e) {
                                                    p = e.originalEvent ? e.originalEvent.touches : e.touches,
                                                        f = p.length,
                                                        p = p[0],
                                                    (Math.abs(p.clientX - c) > 10 || Math.abs(p.clientY - u) > 10) && (d = !0, i())
                                                }).on("touchend" + r,
                                                function (e) {
                                                    i(),
                                                    d || f > 1 || (a = !0, e.preventDefault(), clearTimeout(l), l = setTimeout(function () {
                                                            a = !1
                                                        },
                                                        t), o())
                                                })
                                    })
                            }
                            s.on("click" + r,
                                function () {
                                    a || o()
                                })
                        })
                    },
                        e.fn.destroyMfpFastClick = function () {
                            e(this).off("touchstart" + r + " click" + r),
                            n && x.off("touchmove" + r + " touchend" + r)
                        }
                }(),
                _()
        }),
    function () {
        "use strict";

        function e(t, i) {
            function o(e, t) {
                return function () {
                    return e.apply(t, arguments)
                }
            }

            var r;
            if (i = i || {},
                    this.trackingClick = !1, this.trackingClickStart = 0, this.targetElement = null, this.touchStartX = 0, this.touchStartY = 0, this.lastTouchIdentifier = 0, this.touchBoundary = i.touchBoundary || 10, this.layer = t, this.tapDelay = i.tapDelay || 200, this.tapTimeout = i.tapTimeout || 700, !e.notNeeded(t)) {
                for (var a = ["onMouse", "onClick", "onTouchStart", "onTouchMove", "onTouchEnd", "onTouchCancel"], s = this, l = 0, c = a.length; c > l; l++) s[a[l]] = o(s[a[l]], s);
                n && (t.addEventListener("mouseover", this.onMouse, !0), t.addEventListener("mousedown", this.onMouse, !0), t.addEventListener("mouseup", this.onMouse, !0)),
                    t.addEventListener("click", this.onClick, !0),
                    t.addEventListener("touchstart", this.onTouchStart, !1),
                    t.addEventListener("touchmove", this.onTouchMove, !1),
                    t.addEventListener("touchend", this.onTouchEnd, !1),
                    t.addEventListener("touchcancel", this.onTouchCancel, !1),
                Event.prototype.stopImmediatePropagation || (t.removeEventListener = function (e, n, i) {
                    var o = Node.prototype.removeEventListener;
                    "click" === e ? o.call(t, e, n.hijacked || n, i) : o.call(t, e, n, i)
                },
                    t.addEventListener = function (e, n, i) {
                        var o = Node.prototype.addEventListener;
                        "click" === e ? o.call(t, e, n.hijacked || (n.hijacked = function (e) {
                            e.propagationStopped || n(e)
                        }), i) : o.call(t, e, n, i)
                    }),
                "function" == typeof t.onclick && (r = t.onclick, t.addEventListener("click",
                    function (e) {
                        r(e)
                    },
                    !1), t.onclick = null)
            }
        }

        var t = navigator.userAgent.indexOf("Windows Phone") >= 0,
            n = navigator.userAgent.indexOf("Android") > 0 && !t,
            i = /iP(ad|hone|od)/.test(navigator.userAgent) && !t,
            o = i && /OS 4_\d(_\d)?/.test(navigator.userAgent),
            r = i && /OS [6-7]_\d/.test(navigator.userAgent),
            a = navigator.userAgent.indexOf("BB10") > 0;
        e.prototype.needsClick = function (e) {
            switch (e.nodeName.toLowerCase()) {
                case "button":
                case "select":
                case "textarea":
                    if (e.disabled) return !0;
                    break;
                case "input":
                    if (i && "file" === e.type || e.disabled) return !0;
                    break;
                case "label":
                case "iframe":
                case "video":
                    return !0
            }
            return /\bneedsclick\b/.test(e.className)
        },
            e.prototype.needsFocus = function (e) {
                switch (e.nodeName.toLowerCase()) {
                    case "textarea":
                        return !0;
                    case "select":
                        return !n;
                    case "input":
                        switch (e.type) {
                            case "button":
                            case "checkbox":
                            case "file":
                            case "image":
                            case "radio":
                            case "submit":
                                return !1
                        }
                        return !e.disabled && !e.readOnly;
                    default:
                        return /\bneedsfocus\b/.test(e.className)
                }
            },
            e.prototype.sendClick = function (e, t) {
                var n, i;
                document.activeElement && document.activeElement !== e && document.activeElement.blur(),
                    i = t.changedTouches[0],
                    n = document.createEvent("MouseEvents"),
                    n.initMouseEvent(this.determineEventType(e), !0, !0, window, 1, i.screenX, i.screenY, i.clientX, i.clientY, !1, !1, !1, !1, 0, null),
                    n.forwardedTouchEvent = !0,
                    e.dispatchEvent(n)
            },
            e.prototype.determineEventType = function (e) {
                return n && "select" === e.tagName.toLowerCase() ? "mousedown" : "click"
            },
            e.prototype.focus = function (e) {
                var t;
                i && e.setSelectionRange && 0 !== e.type.indexOf("date") && "time" !== e.type && "month" !== e.type ? (t = e.value.length, e.setSelectionRange(t, t)) : e.focus()
            },
            e.prototype.updateScrollParent = function (e) {
                var t, n;
                if (t = e.fastClickScrollParent, !t || !t.contains(e)) {
                    n = e;
                    do {
                        if (n.scrollHeight > n.offsetHeight) {
                            t = n,
                                e.fastClickScrollParent = n;
                            break
                        }
                        n = n.parentElement
                    } while (n)
                }
                t && (t.fastClickLastScrollTop = t.scrollTop)
            },
            e.prototype.getTargetElementFromEventTarget = function (e) {
                return e.nodeType === Node.TEXT_NODE ? e.parentNode : e
            },
            e.prototype.onTouchStart = function (e) {
                var t, n, r;
                if (e.targetTouches.length > 1) return !0;
                if (t = this.getTargetElementFromEventTarget(e.target), n = e.targetTouches[0], i) {
                    if (r = window.getSelection(), r.rangeCount && !r.isCollapsed) return !0;
                    if (!o) {
                        if (n.identifier && n.identifier === this.lastTouchIdentifier) return e.preventDefault(),
                            !1;
                        this.lastTouchIdentifier = n.identifier,
                            this.updateScrollParent(t)
                    }
                }
                return this.trackingClick = !0,
                    this.trackingClickStart = e.timeStamp,
                    this.targetElement = t,
                    this.touchStartX = n.pageX,
                    this.touchStartY = n.pageY,
                e.timeStamp - this.lastClickTime < this.tapDelay && e.preventDefault(),
                    !0
            },
            e.prototype.touchHasMoved = function (e) {
                var t = e.changedTouches[0],
                    n = this.touchBoundary;
                return Math.abs(t.pageX - this.touchStartX) > n || Math.abs(t.pageY - this.touchStartY) > n ? !0 : !1
            },
            e.prototype.onTouchMove = function (e) {
                return this.trackingClick ? ((this.targetElement !== this.getTargetElementFromEventTarget(e.target) || this.touchHasMoved(e)) && (this.trackingClick = !1, this.targetElement = null), !0) : !0
            },
            e.prototype.findControl = function (e) {
                return void 0 !== e.control ? e.control : e.htmlFor ? document.getElementById(e.htmlFor) : e.querySelector("button, input:not([type=hidden]), keygen, meter, output, progress, select, textarea")
            },
            e.prototype.onTouchEnd = function (e) {
                var t, a, s, l, c, u = this.targetElement;
                if (!this.trackingClick) return !0;
                if (e.timeStamp - this.lastClickTime < this.tapDelay) return this.cancelNextClick = !0,
                    !0;
                if (e.timeStamp - this.trackingClickStart > this.tapTimeout) return !0;
                if (this.cancelNextClick = !1, this.lastClickTime = e.timeStamp, a = this.trackingClickStart, this.trackingClick = !1, this.trackingClickStart = 0, r && (c = e.changedTouches[0], u = document.elementFromPoint(c.pageX - window.pageXOffset, c.pageY - window.pageYOffset) || u, u.fastClickScrollParent = this.targetElement.fastClickScrollParent), s = u.tagName.toLowerCase(), "label" === s) {
                    if (t = this.findControl(u)) {
                        if (this.focus(u), n) return !1;
                        u = t
                    }
                } else if (this.needsFocus(u)) return e.timeStamp - a > 100 || i && window.top !== window && "input" === s ? (this.targetElement = null, !1) : (this.focus(u), this.sendClick(u, e), i && "select" === s || (this.targetElement = null, e.preventDefault()), !1);
                return i && !o && (l = u.fastClickScrollParent, l && l.fastClickLastScrollTop !== l.scrollTop) ? !0 : (this.needsClick(u) || (e.preventDefault(), this.sendClick(u, e)), !1)
            },
            e.prototype.onTouchCancel = function () {
                this.trackingClick = !1,
                    this.targetElement = null
            },
            e.prototype.onMouse = function (e) {
                return this.targetElement ? e.forwardedTouchEvent ? !0 : e.cancelable && (!this.needsClick(this.targetElement) || this.cancelNextClick) ? (e.stopImmediatePropagation ? e.stopImmediatePropagation() : e.propagationStopped = !0, e.stopPropagation(), e.preventDefault(), !1) : !0 : !0
            },
            e.prototype.onClick = function (e) {
                var t;
                return this.trackingClick ? (this.targetElement = null, this.trackingClick = !1, !0) : "submit" === e.target.type && 0 === e.detail ? !0 : (t = this.onMouse(e), t || (this.targetElement = null), t)
            },
            e.prototype.destroy = function () {
                var e = this.layer;
                n && (e.removeEventListener("mouseover", this.onMouse, !0), e.removeEventListener("mousedown", this.onMouse, !0), e.removeEventListener("mouseup", this.onMouse, !0)),
                    e.removeEventListener("click", this.onClick, !0),
                    e.removeEventListener("touchstart", this.onTouchStart, !1),
                    e.removeEventListener("touchmove", this.onTouchMove, !1),
                    e.removeEventListener("touchend", this.onTouchEnd, !1),
                    e.removeEventListener("touchcancel", this.onTouchCancel, !1)
            },
            e.notNeeded = function (e) {
                var t, i, o, r;
                if ("undefined" == typeof window.ontouchstart) return !0;
                if (i = +(/Chrome\/([0-9]+)/.exec(navigator.userAgent) || [, 0])[1]) {
                    if (!n) return !0;
                    if (t = document.querySelector("meta[name=viewport]")) {
                        if (-1 !== t.content.indexOf("user-scalable=no")) return !0;
                        if (i > 31 && document.documentElement.scrollWidth <= window.outerWidth) return !0
                    }
                }
                if (a && (o = navigator.userAgent.match(/Version\/([0-9]*)\.([0-9]*)/), o[1] >= 10 && o[2] >= 3 && (t = document.querySelector("meta[name=viewport]")))) {
                    if (-1 !== t.content.indexOf("user-scalable=no")) return !0;
                    if (document.documentElement.scrollWidth <= window.outerWidth) return !0
                }
                return "none" === e.style.msTouchAction || "manipulation" === e.style.touchAction ? !0 : (r = +(/Firefox\/([0-9]+)/.exec(navigator.userAgent) || [, 0])[1], r >= 27 && (t = document.querySelector("meta[name=viewport]"), t && (-1 !== t.content.indexOf("user-scalable=no") || document.documentElement.scrollWidth <= window.outerWidth)) ? !0 : "none" === e.style.touchAction || "manipulation" === e.style.touchAction ? !0 : !1)
            },
            e.attach = function (t, n) {
                return new e(t, n)
            },
            "function" == typeof define && "object" == typeof define.amd && define.amd ? define(function () {
                return e
            }) : "undefined" != typeof module && module.exports ? (module.exports = e.attach, module.exports.FastClick = e) : window.FastClick = e
    }(),
    $(function () {
        $(window).load(function () {
            window.loaded = !0
        }),
            $(document).on("click", ".dynamic-modal-content",
                function (e) {
                    var t = $(this),
                        n = t.attr("href");
                    openModal(n, !0, t.hasClass("remember-current-state")),
                        e.preventDefault()
                }),
            History.Adapter.bind(window, "statechange",
                function () {
                    if (1 == $.skip_statechange_action) return $.skip_statechange_action = 0,
                        !0;
                    var e = History.getState();
                    return "dynamic-modal-content" == e.data.type ? (openModal(e.url, 0, e.remember_state), !0) : e.data.home || "/" == e.hash ? (closeModal(), !0) : void 0
                }),
            $(document).keyup(function (e) {
                27 == e.keyCode && closeModal()
            }),
            $("#main-menu .menu-item").hover(function (e) {
                    e.stopPropagation(),
                        $(this).addClass("hover")
                },
                function () {
                    $(this).removeClass("hover")
                }),
            $(window).resize(function () {
                    $("#content-modal").scroll()
            }).resize()
    }),


    Particle.GLOBAL_DRAW_COLOR = [0, 0, 0, 255],
    Particle.prototype.submitToFields = function (e) {
        for (var t = 0,
                 n = 0,
                 i = 0; i < e.length; i++) {
            var o = e[i],
                r = o.position.x - this.position.x,
                a = o.position.y - this.position.y,
                s = o.mass / Math.pow(r * r + o.mass / 2 + a * a + o.mass / 2, 1.5);
            t += r * s,
                n += a * s
        }
        this.acceleration = new Vector(t, n)
    },
    Particle.prototype.move = function () {
        this.velocity.x += this.acceleration.x / 1.5,
            this.velocity.y += this.acceleration.y / 1.5,
            this.position.x += this.velocity.x / 1.5,
            this.position.y += this.velocity.y / 1.5
    },
    Particle.prototype.drawVariable = function (e, t) {
        var n = 4 * (~~this.position.y * t + ~~this.position.x),
            i = this.velocity.getMagnitude(),
            o = Particle.GLOBAL_DRAW_COLOR[0] * i,
            r = Particle.GLOBAL_DRAW_COLOR[1],
            a = .5 * Particle.GLOBAL_DRAW_COLOR[2] / i,
            s = Particle.GLOBAL_DRAW_COLOR[3];
        e[n] += o,
            e[n + 1] += r,
            e[n + 2] += a,
            e[n + 3] = s
    },
    Particle.prototype.drawBasic = function (e) {
        var t = e.context;
        t.fillStyle = this.fillStyle,
            t.beginPath(),
            t.arc(this.position.x, this.position.y, this.radius, 0, 2 * Math.PI, !1),
            t.fill(),
        this.stroke_radius && this.drawHole(e)
    },
    Particle.prototype.drawHole = function (e) {
        var t = e.context;
        t.fillStyle = this.holeFillStyle,
            t.beginPath(),
            t.arc(this.position.x, this.position.y, this.stroke_radius, 0, 2 * Math.PI, !1),
            t.fill()
    },
    Particle.prototype.drawSoft = function (e, t) {
        var n = 4 * (~~this.position.y * t + ~~this.position.x),
            i = Particle.GLOBAL_DRAW_COLOR[0],
            o = Particle.GLOBAL_DRAW_COLOR[1],
            r = Particle.GLOBAL_DRAW_COLOR[2],
            a = Particle.GLOBAL_DRAW_COLOR[3];
        e[n - 4] += .8 * i,
            e[n - 3] += .8 * o,
            e[n - 2] += .8 * r,
            e[n - 1] = a,
            e[n] += .8 * i,
            e[n + 1] += .8 * o,
            e[n + 2] += .8 * r,
            e[n + 3] = a,
            e[n + 4] += .8 * i,
            e[n + 5] += .8 * o,
            e[n + 6] += .8 * r,
            e[n + 7] = a,
            n += 4 * t,
            e[n - 4] += .8 * i,
            e[n - 3] += .8 * o,
            e[n - 2] += .8 * r,
            e[n - 1] = a,
            e[n] += i,
            e[n + 1] += o,
            e[n + 2] += r,
            e[n + 3] = a,
            e[n + 4] += .8 * i,
            e[n + 5] += .8 * o,
            e[n + 6] += .8 * r,
            e[n + 7] = a,
            n += 4 * t,
            e[n - 4] += .8 * i,
            e[n - 3] += .8 * o,
            e[n - 2] += .8 * r,
            e[n - 1] = a,
            e[n] += .8 * i,
            e[n + 1] += .8 * o,
            e[n + 2] += .8 * r,
            e[n + 3] = a,
            e[n + 4] += .8 * i,
            e[n + 5] += .8 * o,
            e[n + 6] += .8 * r,
            e[n + 7] = a
    },
    Particle.prototype.draw = Particle.prototype.drawBasic,
    Particle.prototype.setAsMenuAnchorType = function () {
        var e = this;
        e.isFixed = 1,
            e.fillStyle = "#227eef",
            e.connects = 1,
            e.radius = 5,
            e.stroke_radius = 3,
            e.holeFillStyle = "#e8e8e8",
            e.anchor_particle = 1
    },
    Particle.prototype.setAsButtonEdgeType = function () {
        var e = this;
        e.isFixed = 1,
            e.fillStyle = "#227eef",
            e.connects = 1,
            e.radius = 2,
            e.menu_particle = 1
    },
    ParticleEmitter.drawColor = "#999",
    ParticleEmitter.drawColor2 = "#000",
    ParticleEmitter.jitter = .05,
    ParticleEmitter.fromString = function (e) {
        var t = e.substr(1).split(":"),
            n = new ParticleEmitter;
        return n.position = Point.fromString(t.shift()),
            n.velocity = Vector.fromString(t.shift()),
            n.size = parseInt(t.shift()),
            n.particleLife = parseInt(t.shift()),
            n.spread = parseFloat(t.shift()),
            n.emissionRate = parseInt(t.shift().valueOf()),
            n
    },
    Field.drawColor = "rgb(0,0,255)",
    Field.drawColor2 = "rgb(0,0,0)",
    Field.prototype.setMass = function (e) {
        return this.mass = e,
            this.drawColor = 0 > e ? "#900" : "#090",
            this
    },
    Field.prototype.moveTo = function (e) {
        this.position = e
    },
    Field.prototype.toString = function () {
        var e = [this.position.toString(), this.mass];
        return "F" + e.join(":")
    },
    Field.fromString = function (e) {
        var t = e.substr(1).split(":"),
            n = new Field(Point.fromString(t.shift()), parseInt(t.shift()));
        return n
    },
    Vector.prototype.getMagnitude = function () {
        return Math.sqrt(this.x * this.x + this.y * this.y)
    },
    Vector.prototype.multiply = function (e) {
        this.x *= e,
            this.y *= e
    },
    Vector.prototype.add = function (e) {
        this.x += e.x,
            this.y += e.y
    },
    Vector.prototype.vectorTo = function (e) {
        return new Vector(e.x - this.x, e.y - this.y)
    },
    Vector.prototype.withinBounds = function (e, t) {
        return this.x >= e.x - t / 2 && this.x <= e.x + t / 2 && this.y >= e.y - t / 2 && this.y <= e.y + t / 2
    },
    Vector.prototype.getAngle = function () {
        var e = 0,
            t = 0;
        this.x > 0 ? this.y > 0 ? (t = 0, e = this.y / this.x) : (t = 3 * Math.PI / 2, e = this.x / this.y) : this.y > 0 ? (t = Math.PI / 2, e = this.x / this.y) : (t = Math.PI, e = this.y / this.x);
        var n = Math.atan(Math.abs(e)) + t;
        return n
    },
    Vector.prototype.getAngleDegrees = function () {
        return 180 * this.getAngle() / Math.PI
    },
    Vector.prototype.jitter = function (e) {
        return new Vector(this.x + this.x * e * Math.random(), this.y + this.y * e * Math.random())
    },
    Vector.prototype.copy = function () {
        return new Vector(this.x, this.y)
    },
    Vector.prototype.toString = function () {
        return this.x.toFixed(3).replace(/\.?0+$/, "") + "," + this.y.toFixed(3).replace(/\.?0+$/, "")
    },
    Vector.fromAngle = function (e, t) {
        return new Vector(t * Math.cos(e), t * Math.sin(e))
    },
    Vector.fromString = function (e) {
        var t = e.split(",");
        return new Vector(parseFloat(t[0]), parseFloat(t[1]))
    },
    Point = Vector;
var display = null,
    particleSystem = null,
    context = document.getElementById("display").getContext("2d"),
    devicePixelRatio = window.devicePixelRatio || 1,
    backingStoreRatio = context.webkitBackingStorePixelRatio || context.mozBackingStorePixelRatio || context.msBackingStorePixelRatio || context.oBackingStorePixelRatio || context.backingStorePixelRatio || 1,
    scale_ratio = devicePixelRatio / backingStoreRatio;
$(function () {
    var e = document.getElementById("display");
    $(e).attr("width", $(window).width() * scale_ratio),
        $(e).attr("height", $(window).height() * scale_ratio),
        $(e).css("width", $(window).width()),
        $(e).css("height", $(window).height()),
        display = new Display(document.getElementById("display")),
        display.scale = scale_ratio,
        display.init(),
        particleSystem = (new ParticleSystem).init(display),
        display.start(),
        addEmittersAndFields(particleSystem);
    var t = null;
    $(window).resize(function () {
        clearTimeout(t),
            t = setTimeout(function () {
                    particleSystem.emitters = [],
                        particleSystem.fields = [];
                    var e = document.getElementById("display");
                    $(e).attr("width", $(window).width() * scale_ratio),
                        $(e).attr("height", $(window).height() * scale_ratio),
                        $(e).css("width", $(window).width()),
                        $(e).css("height", $(window).height()),
                        particleSystem.display.context.scale(scale_ratio, scale_ratio),
                        particleSystem.display.scale = scale_ratio,
                        particleSystem.display.calculate_scale(),
                        addEmittersAndFields(particleSystem)
                },
                300)
    })
});